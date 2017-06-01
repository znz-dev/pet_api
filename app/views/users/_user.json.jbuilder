case category ||= nil
  when :pets_index
    json.extract! user, :id, :username
  when :brief
    json.extract! user, :id, :username, :avatar
  else
    json.extract! user, :id, :username, :real_name, :phone, :email, :is_admin, :avatar
end


