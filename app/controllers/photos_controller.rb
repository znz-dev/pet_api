class PhotosController < ApplicationController
  def create
    @response, @photo = Photo.create_photo_by_params(params)
    render :show
  end

  def show
    @response, @photo = Photo.query_photo_by_id(params)
  end

  def destroy
    @response = Photo.delete_photo_by_params(params)
  end

end
