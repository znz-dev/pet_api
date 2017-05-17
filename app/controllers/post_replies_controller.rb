class PostRepliesController < ApplicationController
  def create
    @response, @post_reply = PostReply.create_post_reply_by_params(params)
  end

  def destroy
    @response = PostReply.delete_post_reply_by_params(params)
  end
end
