terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.0.1"
    }
  }
}

variable "pet_name_length" {
  type = string
  default = 2
}

resource "random_pet" "this" {
  length = var.pet_name_length
}

output "pet_name" {
  value = random_pet.this.id
}