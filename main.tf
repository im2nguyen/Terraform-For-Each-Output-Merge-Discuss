module "random_pets" {
  source = "./modules/random_pet"

  for_each        = toset(["1", "2", "3", "4"])
  pet_name_length = each.key
}

output "random_pet_names_module" {
  description = "Random pet names"
  value       = module.random_pets
}

output "random_pet_names_map" {
  description = "Random pet names, convert to map"
  value       = { for k in sort(keys(module.random_pets)) : k => module.random_pets[k].pet_name }
}

output "random_pet_names_map_values_only" {
  description = "Random pet names values only"
  value       = { for k in sort(keys(module.random_pets)) : k => module.random_pets[k].pet_name }
}

output "random_pet_names_list" {
  description = "Random pet names convert to list"
  value       = tolist(values({ for k in sort(keys(module.random_pets)) : k => module.random_pets[k].pet_name }))
}

locals {
  bd = tolist(values({ for k in sort(keys(module.random_pets)) : k => module.random_pets[k].pet_name }))
}

output "bd" {
  description = "Random pet names convert to list"
  value       = local.bd
}