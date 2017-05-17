json.post do
  if @post.present?
    json.partial! 'posts/post', post: @post
  else
    json.nil!
  end
end

json.reply_pages @post_replies.total_pages
json.post_replies do
  json.array! @post_replies, partial: 'post_replies/post_reply', as: :post_reply
end