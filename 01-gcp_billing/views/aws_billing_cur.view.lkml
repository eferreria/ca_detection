explore: aws_billing_cur {}
view: aws_billing_cur {
  sql_table_name: `eaf-barong-da-qa.billing.aws_billing_cur` ;;

  dimension: bill_bill_type {
    type: string
    sql: ${TABLE}.bill_BillType ;;
  }
  dimension: bill_billing_entity {
    type: string
    sql: ${TABLE}.bill_BillingEntity ;;
  }
  dimension_group: bill_billing_period_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.bill_BillingPeriodEndDate ;;
  }
  dimension_group: bill_billing_period_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.bill_BillingPeriodStartDate ;;
  }
  dimension: bill_invoice_id {
    type: string
    sql: ${TABLE}.bill_InvoiceId ;;
  }
  dimension: bill_payer_account_id {
    type: number
    sql: ${TABLE}.bill_PayerAccountId ;;
  }
  dimension: identity_line_item_id {
    type: string
    sql: ${TABLE}.identity_LineItemId ;;
  }
  dimension_group: identity_time_interval_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.identity_TimeInterval_End ;;
  }
  dimension_group: identity_time_interval_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.identity_TimeInterval_Start ;;
  }
  dimension: line_item_availability_zone {
    type: string
    sql: ${TABLE}.lineItem_AvailabilityZone ;;
  }
  dimension: line_item_blended_cost {
    type: number
    sql: ${TABLE}.lineItem_BlendedCost ;;
  }
  dimension: line_item_blended_rate {
    type: number
    sql: ${TABLE}.lineItem_BlendedRate ;;
  }
  dimension: line_item_currency_code {
    type: string
    sql: ${TABLE}.lineItem_CurrencyCode ;;
  }
  dimension: line_item_legal_entity {
    type: string
    sql: ${TABLE}.lineItem_LegalEntity ;;
  }
  dimension: line_item_line_item_description {
    type: string
    sql: ${TABLE}.lineItem_LineItemDescription ;;
  }
  dimension: line_item_line_item_type {
    type: string
    sql: ${TABLE}.lineItem_LineItemType ;;
  }
  dimension: line_item_normalization_factor {
    type: number
    sql: ${TABLE}.lineItem_NormalizationFactor ;;
  }
  dimension: line_item_normalized_usage_amount {
    type: number
    sql: ${TABLE}.lineItem_NormalizedUsageAmount ;;
  }
  dimension: line_item_operation {
    type: string
    sql: ${TABLE}.lineItem_Operation ;;
  }
  dimension: line_item_product_code {
    type: string
    sql: ${TABLE}.lineItem_ProductCode ;;
  }
  dimension: line_item_resource_id {
    type: string
    sql: ${TABLE}.lineItem_ResourceId ;;
  }
  dimension: line_item_tax_type {
    type: string
    sql: ${TABLE}.lineItem_TaxType ;;
  }
  dimension: line_item_unblended_cost {
    type: number
    sql: ${TABLE}.lineItem_UnblendedCost ;;
  }
  dimension: line_item_unblended_rate {
    type: number
    sql: ${TABLE}.lineItem_UnblendedRate ;;
  }
  dimension: line_item_usage_account_id {
    type: number
    sql: ${TABLE}.lineItem_UsageAccountId ;;
  }
  dimension: line_item_usage_amount {
    type: number
    sql: ${TABLE}.lineItem_UsageAmount ;;
  }
  dimension_group: line_item_usage_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.lineItem_UsageEndDate ;;
  }
  dimension_group: line_item_usage_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.lineItem_UsageStartDate ;;
  }
  dimension: line_item_usage_type {
    type: string
    sql: ${TABLE}.lineItem_UsageType ;;
  }
  dimension: pricing_currency {
    type: string
    sql: ${TABLE}.pricing_currency ;;
  }
  dimension: pricing_public_on_demand_cost {
    type: number
    sql: ${TABLE}.pricing_publicOnDemandCost ;;
  }
  dimension: pricing_public_on_demand_rate {
    type: number
    sql: ${TABLE}.pricing_publicOnDemandRate ;;
  }
  dimension: pricing_rate_code {
    type: string
    sql: ${TABLE}.pricing_RateCode ;;
  }
  dimension: pricing_rate_id {
    type: string
    sql: ${TABLE}.pricing_RateId ;;
  }
  dimension: pricing_term {
    type: string
    sql: ${TABLE}.pricing_term ;;
  }
  dimension: pricing_unit {
    type: string
    sql: ${TABLE}.pricing_unit ;;
  }
  dimension: product_alarm_type {
    type: string
    sql: ${TABLE}.product_alarmType ;;
  }
  dimension: product_attachment_type {
    type: string
    sql: ${TABLE}.product_attachmentType ;;
  }
  dimension: product_availability {
    type: string
    sql: ${TABLE}.product_availability ;;
  }
  dimension: product_capacitystatus {
    type: string
    sql: ${TABLE}.product_capacitystatus ;;
  }
  dimension: product_category {
    type: string
    sql: ${TABLE}.product_category ;;
  }
  dimension: product_ci_type {
    type: string
    sql: ${TABLE}.product_ciType ;;
  }
  dimension: product_clock_speed {
    type: string
    sql: ${TABLE}.product_clockSpeed ;;
  }
  dimension: product_component {
    type: string
    sql: ${TABLE}.product_component ;;
  }
  dimension: product_compute_family {
    type: string
    sql: ${TABLE}.product_computeFamily ;;
  }
  dimension: product_compute_type {
    type: string
    sql: ${TABLE}.product_computeType ;;
  }
  dimension: product_current_generation {
    type: string
    sql: ${TABLE}.product_currentGeneration ;;
  }
  dimension: product_database_engine {
    type: string
    sql: ${TABLE}.product_databaseEngine ;;
  }
  dimension: product_deployment_option {
    type: string
    sql: ${TABLE}.product_deploymentOption ;;
  }
  dimension: product_description {
    type: string
    sql: ${TABLE}.product_description ;;
  }
  dimension: product_durability {
    type: string
    sql: ${TABLE}.product_durability ;;
  }
  dimension: product_ecu {
    type: string
    sql: ${TABLE}.product_ecu ;;
  }
  dimension: product_endpoint_type {
    type: string
    sql: ${TABLE}.product_endpointType ;;
  }
  dimension: product_engine_code {
    type: string
    sql: ${TABLE}.product_engineCode ;;
  }
  dimension: product_enhanced_networking_supported {
    type: string
    sql: ${TABLE}.product_enhancedNetworkingSupported ;;
  }
  dimension: product_from_location {
    type: string
    sql: ${TABLE}.product_fromLocation ;;
  }
  dimension: product_from_location_type {
    type: string
    sql: ${TABLE}.product_fromLocationType ;;
  }
  dimension: product_gpu {
    type: string
    sql: ${TABLE}.product_gpu ;;
  }
  dimension: product_gpu_memory {
    type: string
    sql: ${TABLE}.product_gpuMemory ;;
  }
  dimension: product_group {
    type: string
    sql: ${TABLE}.product_group ;;
  }
  dimension: product_group_description {
    type: string
    sql: ${TABLE}.product_groupDescription ;;
  }
  dimension: product_instance_family {
    type: string
    sql: ${TABLE}.product_instanceFamily ;;
  }
  dimension: product_instance_name {
    type: string
    sql: ${TABLE}.product_instanceName ;;
  }
  dimension: product_instance_type {
    type: string
    sql: ${TABLE}.product_instanceType ;;
  }
  dimension: product_instance_type_family {
    type: string
    sql: ${TABLE}.product_instanceTypeFamily ;;
  }
  dimension: product_intel_avx2_available {
    type: string
    sql: ${TABLE}.product_intelAvx2Available ;;
  }
  dimension: product_intel_avx_available {
    type: string
    sql: ${TABLE}.product_intelAvxAvailable ;;
  }
  dimension: product_intel_turbo_available {
    type: string
    sql: ${TABLE}.product_intelTurboAvailable ;;
  }
  dimension: product_license_model {
    type: string
    sql: ${TABLE}.product_licenseModel ;;
  }
  dimension: product_location {
    type: string
    sql: ${TABLE}.product_location ;;
  }
  dimension: product_location_type {
    type: string
    sql: ${TABLE}.product_locationType ;;
  }
  dimension: product_logs_destination {
    type: string
    sql: ${TABLE}.product_logsDestination ;;
  }
  dimension: product_max_iops_burst_performance {
    type: string
    sql: ${TABLE}.product_maxIopsBurstPerformance ;;
  }
  dimension: product_max_iopsvolume {
    type: string
    sql: ${TABLE}.product_maxIopsvolume ;;
  }
  dimension: product_max_throughputvolume {
    type: string
    sql: ${TABLE}.product_maxThroughputvolume ;;
  }
  dimension: product_max_volume_size {
    type: string
    sql: ${TABLE}.product_maxVolumeSize ;;
  }
  dimension: product_memory {
    type: string
    sql: ${TABLE}.product_memory ;;
  }
  dimension: product_memory_gib {
    type: string
    sql: ${TABLE}.product_memoryGib ;;
  }
  dimension: product_message_delivery_frequency {
    type: string
    sql: ${TABLE}.product_messageDeliveryFrequency ;;
  }
  dimension: product_message_delivery_order {
    type: string
    sql: ${TABLE}.product_messageDeliveryOrder ;;
  }
  dimension: product_min_volume_size {
    type: string
    sql: ${TABLE}.product_minVolumeSize ;;
  }
  dimension: product_network_performance {
    type: string
    sql: ${TABLE}.product_networkPerformance ;;
  }
  dimension: product_normalization_size_factor {
    type: string
    sql: ${TABLE}.product_normalizationSizeFactor ;;
  }
  dimension: product_operating_system {
    type: string
    sql: ${TABLE}.product_operatingSystem ;;
  }
  dimension: product_operation {
    type: string
    sql: ${TABLE}.product_operation ;;
  }
  dimension: product_physical_cpu {
    type: string
    sql: ${TABLE}.product_physicalCpu ;;
  }
  dimension: product_physical_gpu {
    type: string
    sql: ${TABLE}.product_physicalGpu ;;
  }
  dimension: product_physical_processor {
    type: string
    sql: ${TABLE}.product_physicalProcessor ;;
  }
  dimension: product_platoclassificationtype {
    type: string
    sql: ${TABLE}.product_platoclassificationtype ;;
  }
  dimension: product_platoinstancename {
    type: string
    sql: ${TABLE}.product_platoinstancename ;;
  }
  dimension: product_platoinstancetype {
    type: string
    sql: ${TABLE}.product_platoinstancetype ;;
  }
  dimension: product_platopricingtype {
    type: string
    sql: ${TABLE}.product_platopricingtype ;;
  }
  dimension: product_platostoragetype {
    type: string
    sql: ${TABLE}.product_platostoragetype ;;
  }
  dimension: product_platousagetype {
    type: string
    sql: ${TABLE}.product_platousagetype ;;
  }
  dimension: product_pre_installed_sw {
    type: string
    sql: ${TABLE}.product_preInstalledSw ;;
  }
  dimension: product_processor_architecture {
    type: string
    sql: ${TABLE}.product_processorArchitecture ;;
  }
  dimension: product_processor_features {
    type: string
    sql: ${TABLE}.product_processorFeatures ;;
  }
  dimension: product_product_family {
    type: string
    sql: ${TABLE}.product_productFamily ;;
  }
  dimension: product_product_name {
    type: string
    sql: ${TABLE}.product_ProductName ;;
  }
  dimension: product_queue_type {
    type: string
    sql: ${TABLE}.product_queueType ;;
  }
  dimension: product_region {
    type: string
    sql: ${TABLE}.product_region ;;
  }
  dimension: product_routing_target {
    type: string
    sql: ${TABLE}.product_routingTarget ;;
  }
  dimension: product_routing_type {
    type: string
    sql: ${TABLE}.product_routingType ;;
  }
  dimension: product_servicecode {
    type: string
    sql: ${TABLE}.product_servicecode ;;
  }
  dimension: product_servicename {
    type: string
    sql: ${TABLE}.product_servicename ;;
  }
  dimension: product_sku {
    type: string
    sql: ${TABLE}.product_sku ;;
  }
  dimension: product_storage {
    type: string
    sql: ${TABLE}.product_storage ;;
  }
  dimension: product_storage_class {
    type: string
    sql: ${TABLE}.product_storageClass ;;
  }
  dimension: product_storage_family {
    type: string
    sql: ${TABLE}.product_storageFamily ;;
  }
  dimension: product_storage_media {
    type: string
    sql: ${TABLE}.product_storageMedia ;;
  }
  dimension: product_storage_type {
    type: string
    sql: ${TABLE}.product_storageType ;;
  }
  dimension: product_tenancy {
    type: string
    sql: ${TABLE}.product_tenancy ;;
  }
  dimension: product_to_location {
    type: string
    sql: ${TABLE}.product_toLocation ;;
  }
  dimension: product_to_location_type {
    type: string
    sql: ${TABLE}.product_toLocationType ;;
  }
  dimension: product_transfer_type {
    type: string
    sql: ${TABLE}.product_transferType ;;
  }
  dimension: product_usagetype {
    type: string
    sql: ${TABLE}.product_usagetype ;;
  }
  dimension: product_vcpu {
    type: string
    sql: ${TABLE}.product_vcpu ;;
  }
  dimension: product_version {
    type: string
    sql: ${TABLE}.product_version ;;
  }
  dimension: product_volume_api_name {
    type: string
    sql: ${TABLE}.product_volumeApiName ;;
  }
  dimension: product_volume_type {
    type: string
    sql: ${TABLE}.product_volumeType ;;
  }
  dimension: reservation_amortized_upfront_cost_for_usage {
    type: number
    sql: ${TABLE}.reservation_AmortizedUpfrontCostForUsage ;;
  }
  dimension: reservation_amortized_upfront_fee_for_billing_period {
    type: string
    sql: ${TABLE}.reservation_AmortizedUpfrontFeeForBillingPeriod ;;
  }
  dimension: reservation_effective_cost {
    type: number
    sql: ${TABLE}.reservation_EffectiveCost ;;
  }
  dimension: reservation_end_time {
    type: string
    sql: ${TABLE}.reservation_EndTime ;;
  }
  dimension: reservation_modification_status {
    type: string
    sql: ${TABLE}.reservation_ModificationStatus ;;
  }
  dimension: reservation_normalized_units_per_reservation {
    type: string
    sql: ${TABLE}.reservation_NormalizedUnitsPerReservation ;;
  }
  dimension: reservation_number_of_reservations {
    type: number
    sql: ${TABLE}.reservation_NumberOfReservations ;;
  }
  dimension: reservation_recurring_fee_for_usage {
    type: number
    sql: ${TABLE}.reservation_RecurringFeeForUsage ;;
  }
  dimension: reservation_start_time {
    type: string
    sql: ${TABLE}.reservation_StartTime ;;
  }
  dimension: reservation_subscription_id {
    type: string
    sql: ${TABLE}.reservation_SubscriptionId ;;
  }
  dimension: reservation_total_reserved_normalized_units {
    type: number
    sql: ${TABLE}.reservation_TotalReservedNormalizedUnits ;;
  }
  dimension: reservation_total_reserved_units {
    type: number
    sql: ${TABLE}.reservation_TotalReservedUnits ;;
  }
  dimension: reservation_units_per_reservation {
    type: number
    sql: ${TABLE}.reservation_UnitsPerReservation ;;
  }
  dimension: reservation_unused_amortized_upfront_fee_for_billing_period {
    type: number
    sql: ${TABLE}.reservation_UnusedAmortizedUpfrontFeeForBillingPeriod ;;
  }
  dimension: reservation_unused_normalized_unit_quantity {
    type: number
    sql: ${TABLE}.reservation_UnusedNormalizedUnitQuantity ;;
  }
  dimension: reservation_unused_quantity {
    type: number
    sql: ${TABLE}.reservation_UnusedQuantity ;;
  }
  dimension: reservation_unused_recurring_fee {
    type: number
    sql: ${TABLE}.reservation_UnusedRecurringFee ;;
  }
  dimension: reservation_upfront_value {
    type: number
    sql: ${TABLE}.reservation_UpfrontValue ;;
  }
  dimension: row_key {
    type: string
    sql: ${TABLE}.row_key ;;
  }
  dimension: savings_plan_amortized_upfront_commitment_for_billing_period {
    type: number
    sql: ${TABLE}.savingsPlan_AmortizedUpfrontCommitmentForBillingPeriod ;;
  }
  dimension: savings_plan_recurring_commitment_for_billing_period {
    type: number
    sql: ${TABLE}.savingsPlan_RecurringCommitmentForBillingPeriod ;;
  }
  dimension: savings_plan_savings_plan_arn {
    type: string
    sql: ${TABLE}.savingsPlan_SavingsPlanARN ;;
  }
  dimension: savings_plan_savings_plan_effective_cost {
    type: number
    sql: ${TABLE}.savingsPlan_SavingsPlanEffectiveCost ;;
  }
  dimension: savings_plan_savings_plan_rate {
    type: number
    sql: ${TABLE}.savingsPlan_SavingsPlanRate ;;
  }
  dimension: savings_plan_total_commitment_to_date {
    type: number
    sql: ${TABLE}.savingsPlan_TotalCommitmentToDate ;;
  }
  dimension: savings_plan_used_commitment {
    type: number
    sql: ${TABLE}.savingsPlan_UsedCommitment ;;
  }
  measure: row_count {
    type: count
    drill_fields: [product_product_name, product_volume_api_name, product_platoinstancename, product_instance_name, product_servicename]
  }

  measure: total_cost {
    type: sum
    sql:  ${line_item_unblended_cost} ;;
  }
}
