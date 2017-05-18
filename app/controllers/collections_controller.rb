class CollectionsController < ApplicationController

  def create
    @response, @collection = Collection.create_collection_by_params(params)
  end

  def destroy
    @response = Collection.delete_collection_by_params(params)
  end

end
