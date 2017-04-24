json.extract! pet, :id, :name, :species, :gender, :status, :avatar
json.provider do
  json.partial! 'users/user', user: pet.provider, category: :pets_index
end
