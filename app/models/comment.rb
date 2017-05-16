require 'carrierwave/orm/activerecord'
class Comment < ApplicationRecord

  belongs_to :pet
  belongs_to :user

  validates :content, :pet_id, :user_id, presence: true

  def self.create_comment_by_params(params)
    comment = nil
    response = Response.rescue do |res|
      comment = Comment.create!(comment_params(params))
      res.error('数据有误') if comment.user.blank? || comment.pet.blank?
    end
    [response, comment]
  end

  def self.delete_comment_by_params(params)
    response = Response.rescue do |res|
      comment = Comment.find_by_id(params[:id])
      res.error('不存在该评论') if comment.blank?
      comment.destroy!
    end
    response
  end

  def self.query_comments_by_params(params)
    comments = []
    response = Response.rescue do
      search_params = params[:search] ||= {}
      search_params[:pet_id] = params[:pet_id] if params[:pet_id].present?
      comments = Comment.search_by_params(search_params)
      comments = comments.includes(:user).page(params[:page] ||= 1).per(params[:per] ||= 12)
    end
    [response, comments]
  end

  def self.comment_params(params)
    params.permit(:user_id, :pet_id, :content)
  end

end
