class TopicsController < ApplicationController
  def index
    @response, @topics = Topic.query_topics_by_params(params)
  end

  def create
    @response, @topic = Topic.create_topic_by_params(params)
    render :show
  end

  def show
    @response, @topic = Topic.query_topic_by_id(params)
  end

  def update
    @response, @topic = Topic.update_topic_by_params(params)
    render :show
  end

  def destroy
    @response = Topic.delete_topic_by_id(params)
  end
end
