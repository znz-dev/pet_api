class UsersController < ApplicationController
  def index
    @response, @users = User.query_users_by_params(params)
  end

  def create
    @response, @user = User.create_user_by_params(params)
    render :show
  end

  def show
    @response, @user = User.query_user_by_id(params)
  end

  def update
    @response, @user = User.update_user_by_params(params)
    render :show
  end

  def destroy
    @response = User.delete_user_by_params(params)
  end

  def login
    @response, @user = User.sign_in_by_params(params)
    render :show
  end

  def messages
    @response, @messages = Message.query_messages_by_params(params)
  end
end
