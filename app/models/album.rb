class Album < ApplicationRecord
  has_many :photos
  belongs_to :pet
  def self.create_album_by_params(params)
    album = nil
    response = Response.rescue do |res|
      pet = Pet.find_by_id(params[:pet_id])
      res.error('宠物不存在') if pet.blank?
      res.raise_error('该宠物已经有相簿') if pet.album.present?
      album = Album.new(album_params(params))
      album.save!
    end
    [response, album]
  end

  def self.query_album_by_id(params)
    album = nil
    response = Response.rescue do |res|
      album = Album.find_by_id(params[:id])
      res.error('不存在该相簿') if album.blank?
    end
    [response, album]
  end

  def self.update_album_by_params(params)
    album = nil
    response = Response.rescue do |res|
      album = Album.find_by_id(params[:id])
      res.error('相簿不存在') if album.blank?
      res.error('宠物不存在') if album.pet.blank?
      album.update!(album_params(params))
    end

    [response, album]
  end

  def self.delete_album_by_params(params)
    response = Response.rescue do |res|
      album = Album.find_by_id(params[:id])
      res.raise_error('该相簿不存在') if album.blank?
      album.destroy!
    end
    response
  end

  def self.query_album_by_pet(params)
    album = nil
    response = Response.rescue do |res|
      pet = Pet.find_by_id(params[:pet_id])
      res.raise_error('不存在该宠物') if pet.blank?
      album = pet.album
      res.raise_error('该宠物没有相簿') if album.blank?
    end
    [response, album]
  end

  private

  def self.album_params(params)
    params.permit(:description, :pet_id)
  end
end