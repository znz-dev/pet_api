class CommentsController < ApplicationController

  def create
    @response, @comment = Comment.create_comment_by_params(params)
  end

  def destroy
    @response = Comment.delete_comment_by_params(params)
  end
end
