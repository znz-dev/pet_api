require 'carrierwave/orm/activerecord'

class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  def self.query_users_by_params(_params)
    users = User.all
    users
  end

  def self.create_user_by_params(params)
    user = User.new(user_params(params))
    user.save!
    user
  end

  def self.update_user_by_params(params)
    user = User.find(params[:id])
    p user_params(params)
    user.update!(user_params(params))
    user
  end

  def self.delete_user_by_params(params)
    user = User.find(params [:id])
    user.destroy!
  end

  private

  def self.user_params(params)
    params.require(:user).permit(:username, :avatar, :password, :real_name, :phone, :email)
  end
end
