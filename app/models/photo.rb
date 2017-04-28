class Photo < ApplicationRecord
  belongs_to :album
  mount_uploader :photo, PhotoUploader

  def self.create_photo_by_params(params)
    photo = nil
    response = Response.rescue do |res|
      photo = Photo.new(photo_params(params))
      res.error('相簿不存在') if photo.album.blank?
      res.raise_error('请放入照片') if photo.photo.blank?
      photo.save!
    end
    [response, photo]
  end

  def self.query_photo_by_id(params)
    photo = nil
    response = Response.rescue do |res|
      photo = Photo.find_by_id(params[:id])
      res.error('不存在该相片') if photo.blank?
    end
    [response, photo]
  end

  def self.delete_photo_by_params(params)
    response = Response.rescue do |res|
      photo = Photo.find_by_id(params [:id])
      res.raise_error('该相片不存在') if photo.blank?
      photo.destroy!
    end
    response
  end

  private

  def self.photo_params(params)
    params.permit(:photo, :album_id)
  end
end
