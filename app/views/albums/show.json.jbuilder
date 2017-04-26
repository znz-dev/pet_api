if @album.present?
  json.partial! 'albums/album', album: @album
else
  json.album @album
end
