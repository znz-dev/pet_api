json.total_pages @pets.total_pages
json.pets do
  json.array! @pets, partial: 'pets/pet', as: :pet
end
