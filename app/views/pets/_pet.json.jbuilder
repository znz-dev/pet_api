json.extract! pet, :id, :name, :species, :gender, :status, :avatar, :description, :liked, :location, :requirement, :health, :age

json.provider do
  if pet.provider.present?
    json.partial! 'users/user', user: pet.provider, category: :pets_index
  else
    json.nil!
  end
end

json.adopter do
  if pet.adopter.present?
    json.partial! 'users/user', user: pet.adopter, category: :pets_index
  else
    json.nil!
  end
end
