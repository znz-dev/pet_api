json.total_pages @messages.total_pages
json.messages do
  json.array! @messages, partial: 'messages/message', as: :message
end
