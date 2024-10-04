include: "gcp_billing_export.view.lkml"

view: +gcp_billing_export {
##################### Category Reporting Metrics #####################
#Add additional fields to allowed value in Category field and an additional elsif in the Category Selected field to pivot different metrics

parameter: category {
  label: "Category"
  view_label: "Category Picker"
  type: unquoted
  allowed_value: {
    label: "Service Type"
    value: "service_description"
  }
  allowed_value: {
    label: "Region"
    value: "location__region"
  }
  allowed_value: {
    label: "Project ID"
    value: "project__id"
  }
}

dimension: category_selected {
  view_label: "Category Picker"
  sql:
    {% if category._parameter_value == 'service_description' %} ${service__description}
    {% elsif category._parameter_value == 'location__region' %} ${location__region}
    {% elsif category._parameter_value == 'project__id' %} ${project__id}
    {% else %} ${service__description}
    {% endif %} ;;
}

parameter: date_selection {
  type: unquoted
  allowed_value: {
    label: "Daily"
    value: "day"
  }
  allowed_value: { label: "Weekly" value: "week" }
  allowed_value: { label: "Monthly" value: "month" }
  allowed_value: { label: "Quarterly" value: "quarter" }
  allowed_value: { label: "Yearly" value: "year" }
}

dimension: timeframe_selection {
  label: "Timeframe Selection"
  sql:
  {% if date_selection._parameter_value == 'day' %} ${usage_start_date}
  {% elsif date_selection._parameter_value == 'week' %} ${usage_start_week}
  {% elsif date_selection._parameter_value == 'quarter' %} ${usage_start_quarter}
  {% elsif date_selection._parameter_value == 'year' %} ${usage_start_year}
  {% else %} ${usage_start_month}
  {% endif %} ;;
}
}
