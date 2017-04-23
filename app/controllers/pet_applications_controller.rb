class PetApplicationsController < ApplicationController
  before_action :set_pet_application, only: [:show]
  def index
    @pet_applications = PetApplication.query_pet_applications_by_params(params)
  end

  def create
    @pet_application = PetApplication.create_pet_application_by_params(params)
    render :show
  end

  def show
  end

  def update
    @pet_application = PetApplication.update_pet_application_by_params(params)
    render :show
  end

  def destroy
    PetApplication.delete_pet_application_by_params(params)
    head :no_content
  end

  private

  def set_pet_application
    @pet_application = PetApplication.find(params[:id])
  end
end
