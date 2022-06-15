variable "number_workspaces" {
  default     = 9
  description = "number of workspaces we are using. Default 9 which is also in the run.sh script"
}

variable "tfe_hostname" {
  description = "hostname of your TFE environment"
}

variable "organization" {
  description = "name of the organization you are using"
}

variable "tfe_token" {
  description = "tfe_token to connect to your TFE environment"
}

