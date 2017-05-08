class Message < ApplicationRecord

  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  module Status
    UNREAD = 'unread'
    READED = 'readed'
  end


  def self.create_message_by_params(params)
    message = nil
    response = Response.rescue do |res|
      message = Message.new(message_params(params))
      res.error('收信人不存在') if message.receiver.blank?
      user = User.find_by_id(params[:user_id])
      res.error('收信人不存在') if user.blank?
      message.sender = user
      message.save!
    end
    [response, message]
  end

  def self.query_message_by_id(params)
    message = nil
    response = Response.rescue do |res|
      user = User.find_by_id(params[:user_id])
      message = Message.find_by_id(params[:id])
      res.error('消息不存在') if message.blank?
      if (message.status == Status::UNREAD && message.receiver == user)
        message.status = Status::READED
        message.save!
      end
    end
    [response, message]
  end

  def self.delete_message_by_params(params)
    response = Response.rescue do |res|
      message = Message.find_by_id(params[:id])
      res.raise_error('该消息不存在') if message.blank?
      message.destroy!
    end
    response
  end

  def self.query_messages_by_params(params)
    messages = []
    response = Response.rescue do |res|
      search_params = params[:search]
      messages = Message.search_by_params(search_params)

      user = User.find_by_id(params[:user_id])
      messages = messages.where(sender: user).or(messages.where(receiver: user))
      messages = messages.page(params[:page] ||= 1).per(params[:per] ||= 12)

    end
    [response, messages]
  end

  private

  def self.message_params(params)
    params.permit(:receiver_id, :title, :content)
  end
end
