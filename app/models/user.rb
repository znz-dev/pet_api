require 'carrierwave/orm/activerecord'

class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  has_many :pets, foreign_key: :provider_id

  def self.query_users_by_params(params)
    users = []
    response = Response.rescue do |res|
      users = User.all
      users = users.page(params[:page] ||= 1).per(params[:per] ||= 12)
    end
    [response, users]
  end

  def self.create_user_by_params(params)
    user = nil
    response = Response.rescue do |res|
      user = User.new(user_params(params))
      user.save!
    end
    [response, user]
  end

  def self.query_user_by_id(params)
    user = nil
    response = Response.rescue do |res|
      user = User.find_by_id(params[:id])
      res.raise_error('不存在该用户') if user.blank?
    end
    [response, user]
  end

  def self.update_user_by_params(params)
    user = nil
    response = Response.rescue do |res|
      user = User.find(params[:id])
      user.update!(user_params(params))
    end
    [response, user]
  end

  def self.delete_user_by_params(params)
    response = Response.rescue do |res|
      user = User.find_by_id(params[:id])
      res.raise_error('不存在该用户') if user.blank?
      user.destroy!
    end
    response
  end

  def self.sign_in_by_params(params)
    user = nil
    response = Response.rescue do |res|
      username, password = params.values_at(:username, :password)
      p password
      user = User.find_by_username(username)
      res.raise_error('用户名不存在') if user.blank?
      if user.password != password
        user = nil
        res.raise_error('密码错误')
      end
    end
    [response, user]
  end

  private

  def self.user_params(params)
    params.permit(:username, :avatar, :password, :real_name, :phone, :email)
  end
end
