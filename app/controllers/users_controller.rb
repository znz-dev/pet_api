class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  def index
    @users = User.query_users_by_params(params)
  end

  def create
    @user = User.create_user_by_params(params)
    render :show
  end

  def show
  end

  def update
    @user = User.update_user_by_params(params)
    render :show
  end

  def destroy
    User.delete_user_by_params(params)
    head :no_content
  end

  def login
    @user = User.sign_in_by_params(params)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
