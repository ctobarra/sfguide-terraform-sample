# Each warehosue is associated with a resource monitor. 

# Maybe use modules
# For now, we have only added the depends_on clause

resource "snowflake_warehouse" "warehouse" {
  name           = "TF_test"
  warehouse_size = "xsmall"
  auto_suspend   = 62
  # resource_monitor = "Monitor_TF_test"
}

resource "snowflake_resource_monitor" "monitor" {
  name         = "Monitor_TF_test"
  credit_quota = 100   # The number of credits allocated monthly to the resource monitor.
  
  warehouses   = ["TF_test"]
  set_for_account = false

  frequency       = "MONTHLY"
  start_timestamp = "Immediately"

  notify_triggers            = [52, 70]     # Notify when this % of credit is used.
  suspend_triggers           = [100]           # Suspend and notify when this % of credit is used.
  suspend_immediate_triggers = [110]          # Suspend immediately and notify when this % of credit is used

  # notify_users = ["USERONE", "USERTWO"]

  # # Add a dependency on the resource monitor
  depends_on = [snowflake_warehouse.warehouse]
}
