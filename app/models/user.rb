require 'carrierwave/orm/activerecord'

class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  has_many :pets, foreign_key: :provider_id

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
    user.update!(user_params(params))
    user
  end

  def self.delete_user_by_params(params)
    user = User.find(params [:id])
    user.destroy!
  end

  def self.sign_in_by_params(params)
    username, password = params.values_at(:username, password)
    user = User.find_by_username(username)
  end

  private

  def self.user_params(params)
    params.permit(:username, :avatar, :password, :real_name, :phone, :email)
  end
end
