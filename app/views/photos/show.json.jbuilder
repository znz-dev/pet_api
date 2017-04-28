json.photo do
  if @photo.present?
    json.partial! 'photos/photo', photo: @photo
  else
    json.nil!
  end
end
