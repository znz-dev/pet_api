json.total_pages @adoption_applies.total_pages
json.adoption_applies do
  json.array! @adoption_applies, partial: 'adoption_applies/adoption_apply', as: :adoption_apply
end
