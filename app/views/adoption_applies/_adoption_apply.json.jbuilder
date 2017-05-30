json.extract! adoption_apply, :id, :status, :content, :created_at

json.pet do
  if adoption_apply.pet.present?
    json.partial! 'pets/pet', pet: adoption_apply.pet
  else
    json.nil!
  end
end

json.user do
  if adoption_apply.user.present?
    json.partial! 'users/user', user: adoption_apply.user, category: :brief
  else
    json.nil!
  end
end

json.provider do
  if adoption_apply.provider.present?
    json.partial! 'users/user', user: adoption_apply.provider, category: :brief
  else
    json.nil!
  end
end

