class Topic < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :posts, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  def self.create_topic_by_params(params)
    topic = nil
    response = Response.rescue do
      topic = Topic.new(comment_params(params))
      topic.save!
    end
    [response, topic]
  end

  def self.query_topic_by_id(params)
    topic = nil
    response = Response.rescue do
      topic = Topic.find_by_id(params[:id])
    end
    [response, topic]
  end

  def self.query_topics_by_params(_params)
    topics = []
    response = Response.rescue do
      topics = Topic.all
    end
    [response, topics]
  end

  def self.update_topic_by_params(params)
    topic = nil
    response = Response.rescue do |res|
      topic = Topic.find_by_id(params[:id])
      res.error('不存在该板块') if topic.blank?
      topic.update!(comment_params(params))
    end
    [response, topic]
  end

  def self.delete_topic_by_id(params)
    response = Response.rescue do |res|
      topic = Topic.find_by_id(params[:id])
      res.error('不存在该板块') if topic.blank?
      topic.destroy!
    end
    response
  end

  def self.comment_params(params)
    params.permit(:name, :avatar, :description)
  end

end
