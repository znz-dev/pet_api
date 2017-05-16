json.topics do
  json.array! @topics, partial: 'topics/topic', as: :topic
end
