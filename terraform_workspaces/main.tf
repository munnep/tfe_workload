resource "tfe_workspace" "test" {
  count        = var.number_workspaces
  name         = "test-test${count.index}"
  organization = var.organization
  tag_names    = ["test-workload"]
}

resource "tfe_variable" "test" {
  count        = var.number_workspaces
  key          = "TFE_PARALLELISM"
  value        = "200"
  category     = "env"
  workspace_id = tfe_workspace.test[count.index].id
  description  = "Parallelism high for testing load"
}


