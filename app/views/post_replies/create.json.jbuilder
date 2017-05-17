json.post_reply do
  if @post_reply.present?
    json.partial! 'post_replies/post_reply', post_reply: @post_reply
  else
    json.nil!
  end
end