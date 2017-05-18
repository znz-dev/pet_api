json.total_pages @collections.total_pages
json.collections do
  json.array! @collections, partial: 'collections/collection', as: :collector
end