json.extract! post, :id, :topic_id, :title, :created_at

json.user do
  if post.user.present?
    json.partial! 'users/user', user: post.user, category: :brief
  else
    json.nil!
  end
end
