case category ||= nil
  when :pets_index
    json.extract! user, :id, :username
  else
    json.extract! user, :id, :username, :real_name, :phone, :email
end


