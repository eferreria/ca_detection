view: pricing_mapping {
  derived_table: {
    explore_source: cloud_pricing {
      column: category {}
      column: service__description {}
      column: service__id {}
      column: sku__id {}
    }
  }
  dimension: category {
    description: ""
  }
  dimension: service__description {
    description: "The Google Cloud Platform service that offers the SKU."
  }
  dimension: service__id {
    description: "The ID of the Google Cloud Platform service that offers the SKU."
  }

  dimension: sku__id {
    description: "The ID of the Google Cloud Platform SKU"
  }

  dimension: marketplace_purchase {
    type: yesno
    label: "Is Marketplace Purchase? (Yes/No)"
    sql:   ${category} = "Marketplace Services";;
  }
}
