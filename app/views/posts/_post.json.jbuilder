json.extract! post, :id, :topic_id, :title

json.user do
  if post.user.present?
    json.partial! 'users/user', user: post.user, category: :brief
  else
    json.nil!
  end
end
