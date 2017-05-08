class PetApplication < ApplicationRecord
  def self.query_pet_applications_by_params(_params)
    pet_applications = PetApplication.all
    pet_applications
  end

  def self.create_pet_application_by_params(params)
    pet_application = PetApplication.new(pet_application_params(params))
    pet_application.save!
    pet_application
  end

  def self.update_pet_application_by_params(params)
    pet_application = PetApplication.find(params[:id])
    pet_application.update!(pet_application_params(params))
    pet_application
  end

  def self.delete_pet_application_by_params(params)
    pet_application = PetApplication.find(params[:id])
    pet_application.destroy!
  end
end
