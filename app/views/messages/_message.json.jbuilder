case category ||= nil
  when :show
    json.extract! message, :id, :title, :content, :status, :created_at
  else
    json.extract! message, :id, :title, :status, :created_at
end

json.sender do
  # message.sender
  if message.sender.present?
    json.partial! 'users/user', user: message.sender, category: :pets_index
  else
    json.nil!
  end
end

json.receiver do
  # message.receiver
  if message.receiver.present?
    json.partial! 'users/user', user: message.receiver, category: :pets_index
  else
    json.nil!
  end
end
