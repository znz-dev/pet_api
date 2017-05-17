class PostsController < ApplicationController

  def index
    @response, @posts = Post.query_posts_by_params(params)
  end

  def create
    @response, @post, @post_replies = Post.create_post_by_params(params)
    render :show
  end

  def show
    @response, @post, @post_replies = Post.query_post_by_id(params)
  end

  def destroy
    @response = Post.delete_post_by_params(params)
  end

end
