view: project_create_model_net_cost {
  derived_table: {
    datagroup_trigger: monthly_on_day_2
    # persist_for: "24 hours"
    create_process: {

      ## STEP 1: create or replace the training data table
      #(
      sql_step:
          {% assign mdl_name = 'project_net_cost_forecast' %}
          CREATE OR REPLACE TABLE `@{GCP_PROJECT}.@{BQML_DATASET}.TRAINING_DATA_{{ mdl_name }}` AS
          SELECT
            usage_start_date,
            project_id,
            total_net_cost
          FROM ${project_input_data_net_cost.SQL_TABLE_NAME}
          WHERE usage_start_date < DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY)
      ;;
      #)

        ## STEP 2: create or replace the ARIMA model
        #(
        sql_step:
          {% assign mdl_name = 'project_net_cost_forecast' %}
          CREATE OR REPLACE MODEL `@{GCP_PROJECT}.@{BQML_DATASET}.{{ mdl_name }}`
          OPTIONS(  MODEL_TYPE = 'ARIMA_PLUS'
                ,  TIME_SERIES_TIMESTAMP_COL = 'usage_start_date'
                ,  TIME_SERIES_DATA_COL = 'total_net_cost'
                ,  TIME_SERIES_ID_COL = ['project_id']
                ,  HORIZON = @{FORECAST_HORIZON}
                ,  HOLIDAY_REGION =  'GLOBAL' -- Acceptable values are 'GLOBAL' or ['US', 'GB']. If enabled, update Step 4
                ,  AUTO_ARIMA = TRUE
                ,  FORECAST_LIMIT_LOWER_BOUND = 0
          )
        AS (SELECT * FROM `@{GCP_PROJECT}.@{BQML_DATASET}.TRAINING_DATA_{{ mdl_name }}`)
        ;;
      #)

          ## STEP 3 AND 4: capture MODEL_INFO details including model_name & date_created (which will be used as model identifier in evaluation tables)
          #(
          sql_step:
          CREATE OR REPLACE TABLE ${SQL_TABLE_NAME}
            (model_name           STRING
            , model_type          STRING
            , date_created        TIMESTAMP
            , horizon             INT64
            , holiday_region      STRING
            , looker_connection   STRING
            , bigquery_dataset    STRING)
          ;;

          sql_step:
          {% assign mdl_name = 'project_net_cost_forecast' %}
          INSERT ${SQL_TABLE_NAME}
          SELECT   '{{ mdl_name }}'
                , 'ARIMA_PLUS'
                , CURRENT_TIMESTAMP()
                , @{FORECAST_HORIZON}
                , 'TRUE' -- Update if HOLIDAY_REGION is enabled in Step 2.
                , '@{CONNECTION_NAME}'
                , '@{GCP_PROJECT}.@{BQML_DATASET}'
          ;;
      #)

            ## STEP 5, 6, 7: update ANOMALY_DETECTION_BQML_MODEL_INFO from TRAINING_DATA, ML.TRAINING_INFO, and ML.FEATURE_INFO
            #(
            sql_step:
                      CREATE TABLE IF NOT EXISTS `@{GCP_PROJECT}.@{BQML_DATASET}.ANOMALY_DETECTION_BQML_MODEL_INFO`
                        ( model_name STRING,
                          model_type STRING,
                          date_created TIMESTAMP,
                          horizon INT64,
                          holiday_region STRING,
                          looker_connection STRING,
                          bigquery_dataset STRING,
                          min_usage_start_date DATE,
                          max_usage_start_date DATE,
                          duration_ms INT64,
                          feature_info ARRAY<STRUCT<input STRING, min FLOAT64, max FLOAT64, median FLOAT64, stddev FLOAT64, category_count INT64, null_count INT64>>,
                          is_latest_model_version BOOL
                        )
                  ;;

            sql_step:
                      {% assign mdl_name = 'project_net_cost_forecast' %}
                      UPDATE `@{GCP_PROJECT}.@{BQML_DATASET}.ANOMALY_DETECTION_BQML_MODEL_INFO`
                      SET is_latest_model_version = FALSE
                      WHERE model_name = '{{ mdl_name }}'
                      AND is_latest_model_version = TRUE
                  ;;

            sql_step:
                      {% assign mdl_name = 'project_net_cost_forecast' %}
                      INSERT `@{GCP_PROJECT}.@{BQML_DATASET}.ANOMALY_DETECTION_BQML_MODEL_INFO`
                      WITH d AS (SELECT  MIN(usage_start_date) as min_date
                                      , MAX(usage_start_date) as max_date
                                FROM `@{GCP_PROJECT}.@{BQML_DATASET}.TRAINING_DATA_{{ mdl_name }}`)
                          ,t AS (SELECT duration_ms
                                FROM ML.TRAINING_INFO(MODEL `@{GCP_PROJECT}.@{BQML_DATASET}.{{ mdl_name }}`))
                          ,f AS (SELECT ARRAY_AGG(STRUCT(input,min,max,median,stddev,category_count,null_count)) AS feature_info
                                FROM ML.FEATURE_INFO(MODEL `@{GCP_PROJECT}.@{BQML_DATASET}.{{ mdl_name }}`))

              SELECT a.*
              ,d.min_date
              ,d.max_date
              ,t.duration_ms
              ,f.feature_info
              ,TRUE AS is_latest_model_version
              FROM ${SQL_TABLE_NAME} a
              CROSS JOIN d
              CROSS JOIN t
              CROSS JOIN f
              ;;
            #)


            ## STEP 8, 9, 10: capture ML.ARIMA_EVALUATE and ML.ARIMA_COEFFICIENTS history for the model
            #(
            sql_step:
                      {% assign mdl_name = 'project_net_cost_forecast' %}
                      CREATE TABLE IF NOT EXISTS `@{GCP_PROJECT}.@{BQML_DATASET}.ARIMA_EVALUATE_{{ mdl_name }}`
                        ( model_name STRING,
                          date_created TIMESTAMP,
                          project_id STRING,
                          ar_coefficients ARRAY<FLOAT64>,
                          ma_coefficients ARRAY<FLOAT64>,
                          intercept_or_drift FLOAT64,
                          non_seasonal_p INT64,
                          non_seasonal_d INT64,
                          non_seasonal_q INT64,
                          has_drift BOOL,
                          log_likelihood FLOAT64,
                          AIC FLOAT64,
                          variance FLOAT64,
                          seasonal_periods ARRAY<STRING>,
                          has_holiday_effect BOOL,
                          has_spikes_and_dips BOOL,
                          has_step_changes BOOL,
                          error_message STRING,
                          is_latest_model_version BOOL,
                        )
                  ;;

            sql_step:
                      {% assign mdl_name = 'project_net_cost_forecast' %}
                      UPDATE `@{GCP_PROJECT}.@{BQML_DATASET}.ARIMA_EVALUATE_{{ mdl_name }}`
                      SET is_latest_model_version = FALSE
                      WHERE is_latest_model_version = TRUE
                  ;;

            sql_step:
                      {% assign mdl_name = 'project_net_cost_forecast' %}
                      INSERT `@{GCP_PROJECT}.@{BQML_DATASET}.ARIMA_EVALUATE_{{ mdl_name }}`
                      WITH c AS (SELECT *
                                FROM ML.ARIMA_COEFFICIENTS(MODEL `@{GCP_PROJECT}.@{BQML_DATASET}.{{ mdl_name }}`))
                          ,e AS (SELECT *
                                FROM ML.ARIMA_EVALUATE(MODEL `@{GCP_PROJECT}.@{BQML_DATASET}.{{ mdl_name }}`))

              SELECT m.model_name
              ,m.date_created
              ,c.project_id
              ,c.ar_coefficients
              ,c.ma_coefficients
              ,c.intercept_or_drift
              ,e.* EXCEPT(project_id)
              , TRUE AS is_latest_model_version
              FROM c
              JOIN e on c.project_id = e.project_id
              CROSS JOIN ${SQL_TABLE_NAME} m
              ;;
            #)
          }
        }

        dimension: run_model {
          sql: "Model finished training" ;;
        }
      }
