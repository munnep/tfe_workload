terraform {
  backend "remote" {
    hostname     = "patrick-tfe6.bg.hashicorp-success.com"
    organization = "test"

    workspaces {
      prefix = "test-"
    }
  }
}

variable "pet_words" {
  default     = 10
  description = "Number of words per pet"
}
variable "pets_count" {
  default     = 2500
  description = "Count of pets"
}
variable "string_length" {
  default = 512
}

resource "random_pet" "ourhoard" {
  count  = var.pets_count
  length = var.pet_words
  keepers = {
    # Generate a new pet name each time the time changes
    make_on_every_apply = timestamp()
  }
}

resource "random_string" "random" {
  count            = var.pets_count
  length           = var.string_length
  special          = true
  override_special = "/@£$"
  keepers = {
    # Generate a new string  each time the time changes
    make_on_every_apply = timestamp()
  }
}

resource "null_resource" "random_string" {
  count            = var.pets_count
}

