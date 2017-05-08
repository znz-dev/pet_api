case category ||= nil
  when :show
    json.extract! message, :id, :title, :content, :status, :created_at
  else
    json.extract! message, :id, :title, :status, :created_at
end

json.sender do
  # message.sender
  json.partial! 'users/user', user: message.sender, category: :pets_index
end
json.receiver  do
  # message.receiver
  json.partial! 'users/user', user: message.receiver, category: :pets_index
end