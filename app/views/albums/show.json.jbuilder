json.album do
  if @album.present?
    json.partial! 'albums/album', album: @album
    json.photos do
      json.array! @album.photos, partial: 'photos/photo', as: :photo
    end
  else
    json.nil!
  end
end

