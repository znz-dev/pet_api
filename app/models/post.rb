class Post < ApplicationRecord
  belongs_to :user
  belongs_to :topic

  validates :topic_id, :user_id, :title, presence: true

  has_many :post_replies, dependent: :destroy

  def self.create_post_by_params(params)
    post = nil
    post_replies = PostReply.none.page
    response = Response.rescue do |res|
      Post.transaction do
        post = Post.new(post_params(params))
        res.error('参数缺失或错误') if post.user.blank? || post.topic.blank?
        post.save!

        if params[:content].present?
          post_reply = PostReply.new(reply_params(params))
          post_reply.post = post
          post_reply.save!
          post_replies = PostReply.where(post: post).page
        end
      end
    end
    [response, post, post_replies]
  end

  def self.query_post_by_id(params)
    post = nil
    post_replies = PostReply.none.page
    response = Response.rescue do |res|
      post = Post.find_by_id(params[:id])
      res.error('不存在该帖子') if post.blank?
      post_replies = post.post_replies.includes(:user).page(params[:page] ||= 1).per(params[:per] ||= 12)
    end
    [response, post, post_replies]
  end

  def self.query_posts_by_params(params)
    posts = []
    response = Response.rescue do |res|
      search_params = params[:search] ||= {}
      search_params[:topic_id] = params[:topic_id] if params[:topic_id].present?
      posts = Post.search_by_params(search_params)
      posts = posts.includes(:user).page(params[:page] ||= 1).per(params[:per] ||= 12)
    end
    [response, posts]
  end

  def self.delete_post_by_params(params)
    response = Response.rescue do |res|
      post = Post.find_by_id(params[:id])
      res.error('不存在该帖子') if post.blank?
      post.destroy!
    end
    response
  end

  def self.post_params(params)
    params.permit(:topic_id, :user_id, :title)
  end

  def self.reply_params(params)
    params.permit(:user_id, :content)
  end

end
