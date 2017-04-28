json.pets do
  json.array! @pets, partial: 'pets/pet', as: :pet
end
