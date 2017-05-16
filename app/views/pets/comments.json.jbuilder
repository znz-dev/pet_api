json.total_pages @comments.total_pages
json.comments do
  json.array! @comments, partial: 'comments/comment', as: :comment
end