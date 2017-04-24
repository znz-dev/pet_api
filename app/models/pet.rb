require 'carrierwave/orm/activerecord'

class Pet < ApplicationRecord
  belongs_to :provider, class_name: 'User'
  mount_uploader :avatar, AvatarUploader

  module Order
    TIME_ASC = 'time_asc'
    TIME_DESC = 'time_desc'
  end

  def self.query_pets_by_params(params)
    pets = []
    response = Response.rescue do |res|
      pets = Pet.all.includes(:provider)
      case params[:order]
      when Order::TIME_ASC
        pets = pets.order(created_at: :asc)
      when Order::TIME_DESC
        pets = pets.order(created_at: :desc)
      end
      pets = pets.page(params[:page] ||= 1).per(params[:per] ||= 12)

    end
    [response, pets]
  end

  def self.create_pet_by_params(params)
    pet = nil
    response = Response.rescue do |res|
      pet = Pet.new(pet_params(params))
      res.raise_error('领养人不存在') if pet.provider.blank?
      pet.save!
    end
    [response, pet]
  end

  def self.query_pet_by_id(params)
    pet = nil
    response = Response.rescue do |res|
      pet = Pet.find_by_id(params[:id])
      res.error('不存在该宠物') if pet.blank?
    end
    [response, pet]
  end

  def self.update_pet_by_params(params)
    pet = nil
    response = Response.rescue do |res|
      pet = Pet.find_by_id(params[:id])
      pet.update!(pet_params(params))
    end

    [response, pet]
  end

  def self.delete_pet_by_params(params)
    response = Response.rescue do |res|
      pet = Pet.find_by_id(params [:id])
      res.raise_error('该用户不存在') if pet.blank?
      pet.destroy!
    end
    response
  end

  private

  def self.pet_params(params)
    params.permit(:name, :species, :gender, :status, :avatar, :provider_id)
  end
end
