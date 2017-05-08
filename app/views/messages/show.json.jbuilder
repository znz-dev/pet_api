json.message do
  if @message.present?
    json.partial! 'messages/message', message: @message, category: :show
  else
    json.nil!
  end
end
