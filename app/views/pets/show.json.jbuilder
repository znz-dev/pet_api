if @pet.present?
  json.partial! 'pets/pet', pet: @pet
else
  json.pet @pet
end
