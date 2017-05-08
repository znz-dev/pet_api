class MessagesController < ApplicationController

  def create
    @response, @message = Message.create_message_by_params(params)
    render :show
  end

  def show
    @response, @message = Message.query_message_by_id(params)
  end

  def destroy
    @response = Message.delete_message_by_params(params)
  end

end
