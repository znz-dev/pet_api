class PostReply < ApplicationRecord
  belongs_to :post

  belongs_to :user

  validates :post_id, :content, :user_id, presence: true

  def self.create_post_reply_by_params(params)
    post_reply = nil
    response = Response.rescue do |res|
      post_reply = PostReply.new(post_reply_params(params))
      res.error('参数缺失或错误') if post_reply.user.blank? || post_reply.post.blank?
      post_reply.save!
    end
    [response, post_reply]
  end

  def self.delete_post_reply_by_params(params)
    response = Response.rescue do |res|
      post_reply = PostReply.find_by_id(params[:id])
      res.error('不存在该回复') if post_reply.blank?
      post_reply.destroy!
    end
    response
  end

  def self.post_reply_params(params)
    params.permit(:post_id, :user_id, :content)
  end
end
