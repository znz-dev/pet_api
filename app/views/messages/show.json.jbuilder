json.message do
  if @message.present?
    json.partial! 'messages/message', message: @message
  else
    json.nil!
  end
end
