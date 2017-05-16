json.topic do
  if @topic.present?
    json.partial! 'topics/topic', topic: @topic
  else
    json.nil!
  end
end