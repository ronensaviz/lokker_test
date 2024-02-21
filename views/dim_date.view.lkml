# The name of this view in Looker is "Dim Date"
view: dim_date {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `INGESTION.dim_date` ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Day Is Weekday" in Explore.

  dimension: day_is_weekday {
    type: number
    sql: ${TABLE}.day_is_weekday ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_day_is_weekday {
    type: sum
    sql: ${day_is_weekday} ;;  }
  measure: average_day_is_weekday {
    type: average
    sql: ${day_is_weekday} ;;  }

  dimension: day_name {
    type: string
    sql: ${TABLE}.day_name ;;
  }

  dimension: fiscal_qtr {
    type: string
    sql: ${TABLE}.fiscal_qtr ;;
  }

  dimension: fiscal_year {
    type: number
    sql: ${TABLE}.fiscal_year ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: full {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.full_date ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  dimension: month_name {
    type: string
    sql: ${TABLE}.month_name ;;
  }

  dimension: week_day {
    type: string
    sql: ${TABLE}.week_day ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: year_day {
    type: number
    sql: ${TABLE}.year_day ;;
  }

  dimension: year_week {
    type: number
    sql: ${TABLE}.year_week ;;
  }
  measure: count {
    type: count
    drill_fields: [id, month_name, day_name]
  }
  measure: max_year {
    type: max
    sql: ${TABLE}.year ;;
  }

  dimension: state_flag_image {
    type: string
    sql: ${year} ;;
    html:
              {% if year._value == 2024 %}
              <img src="https://upload.wikimedia.org/wikipedia/commons/0/01/Flag_of_California.svg" height="170" width="255">
              {% elsif year._value == 2025 %}
              <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Flag_of_New_York.svg/1200px-Flag_of_New_York.svg.png" height="170" width="255">
              {% elsif year._value == 2026 %}
              <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Flag_of_Colorado.svg/255px-Flag_of_Colorado.svg.png" height="170" width="255">
              {% elsif year._value == 2027 %}
              <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Flag_of_Illinois.svg/1200px-Flag_of_Illinois.svg.png" height="170" width="255">
              {% else %}
              <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png" height="170" width="170">
              {% endif %} ;;
  }

}
