json.total_pages @posts.total_pages
json.posts do
  json.array! @posts, partial: 'posts/post', as: :post
end
