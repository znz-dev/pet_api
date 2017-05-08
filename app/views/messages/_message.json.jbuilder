json.extract! message, :id, :content, :status, :created_at

json.sender do
  # message.sender
  json.partial! 'users/user', user: message.sender, category: :pets_index
end
json.receiver  do
  # message.receiver
  json.partial! 'users/user', user: message.receiver, category: :pets_index
end