class PetsController < ApplicationController
  def index
    @response, @pets = Pet.query_pets_by_params(params)
  end

  def create
    @response, @pet = Pet.create_pet_by_params(params)
    render :show
  end

  def show
    @response, @pet = Pet.query_pet_by_id(params)
  end

  def update
    @response, @pet = Pet.update_pet_by_params(params)
    render :show
  end

  def destroy
    @response = Pet.delete_pet_by_params(params)
  end
end
