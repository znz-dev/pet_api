class AlbumsController < ApplicationController
  def create
    @response, @album = Album.create_album_by_params(params)
    render :show
  end

  def show
    @response, @album = Album.query_album_by_id(params)
  end

  def update
    @response, @album = Album.update_album_by_params(params)
    render :show
  end

  def destroy
    @response = Album.delete_album_by_params(params)
  end
end
