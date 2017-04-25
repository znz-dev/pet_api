json.extract! pet, :id, :name, :species, :gender, :status, :avatar
if pet.provider.present?
  json.provider do
    json.partial! 'users/user', user: pet.provider, category: :pets_index
  end
else
  json.provider nil
end

if pet.adopter.present?
  json.adopter do
    json.partial! 'users/user', user: pet.adopter, category: :pets_index
  end
else
  json.adopter nil
end
