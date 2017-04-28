json.user do
  if @user.present?
    json.partial! 'users/user', user: @user
  else
    json.nil!
  end
end
