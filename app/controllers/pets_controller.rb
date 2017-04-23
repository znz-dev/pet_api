class PetsController < ApplicationController
  before_action :set_pet, only: [:show]
  def index
    @pets = Pet.query_pets_by_params(params)
  end

  def create
    @pet = Pet.create_pet_by_params(params)
    render :show
  end

  def show
  end

  def update
    @pet = Pet.update_pet_by_params(params)
    render :show
  end

  def destroy
    Pet.delete_pet_by_params(params)
    head :no_content
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end
end
