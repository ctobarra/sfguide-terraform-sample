terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.87"
    }
  }
}

# This is the service user for terraform. It will create the objects
provider "snowflake" {
  account                = "UD29617.eu-west-3.aws" 
  username               = "tf-snow" 

  # You can configure a connection to Snowflake using the Snowflake JDBC driver 
  # so that it passes a JSON Web Token (JWT) when authenticating to the database.
  authenticator          = "JWT" # required if not using password as auth method

  # One of these two options
  private_key_path       = "~/.ssh/snowflake_tf_snow_key.p8"
  # private_key            = "cat ~/.ssh/snowflake_tf_snow_key.p8"


  # alias     = "sys_admin"
  # role      = "SYSADMIN"
  role      = "ACCOUNTADMIN"
}