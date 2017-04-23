require 'carrierwave/orm/activerecord'

class Pet < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  def self.query_pets_by_params(_params)
    pets = Pet.all
    pets
  end

  def self.create_pet_by_params(params)
    pet = Pet.new(pet_params(params))
    pet.save!
    pet
  end

  def self.update_pet_by_params(params)
    pet = Pet.find(params[:id])
    pet.update!(pet_params(params))
    pet
  end

  def self.delete_pet_by_params(params)
    pet = Pet.find(params [:id])
    pet.destroy!
  end

  private

  def self.pet_params(params)
    params.permit(:name, :species, :gender, :status, :avatar)
  end
end
