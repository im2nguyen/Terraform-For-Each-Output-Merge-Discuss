module "random_pets_first" {
  source = "./modules/random_pet"

  for_each        = toset(["1", "2"])
  pet_name_length = each.key
}

module "random_pets_second" {
  source = "./modules/random_pet"

  for_each        = toset(["3", "4"])
  pet_name_length = each.key
}

output "random_pet_names" {
  description = "Random pet names"
  value       = merge(module.random_pets_first, module.random_pets_second)
}