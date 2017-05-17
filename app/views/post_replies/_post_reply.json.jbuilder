json.extract! post_reply, :id, :content

json.user do
  if post_reply.user.present?
    json.partial! 'users/user', user: post_reply.user, category: :brief
  else
    json.nil!
  end
end
