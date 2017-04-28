json.pet do
  if @pet.present?
    json.partial! 'pets/pet', pet: @pet
  else
    json.nil!
  end
end

