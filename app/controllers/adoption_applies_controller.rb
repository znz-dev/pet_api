class AdoptionAppliesController < ApplicationController
  def create
    @response, @adoption_apply = AdoptionApply.create_adoption_apply_by_params(params)
  end

  def show
    @response, @adoption_apply = AdoptionApply.get_adoption_apply_by_id(params)
    render :create
  end

  def update
    @response, @adoption_apply = AdoptionApply.update_adoption_apply_by_params(params)
    render :create
  end

  def index
    @response, @adoption_applies = AdoptionApply.get_adoption_applies_by_params(params)
  end
end
