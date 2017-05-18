json.collection do
  if @collection.present?
    json.partial! 'collections/collection', collector: @collection
  else
    json.nil!
  end
end
