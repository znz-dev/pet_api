json.extract! comment, :id, :content, :created_at

json.user do
  if comment.user.present?
    json.partial! 'users/user', user: comment.user, category: :brief
  else
    json.nil!
  end
end