class Response
  attr_accessor :code, :message

  module Code
    SUCCESS = '20000'

    ERROR = '50000'
  end

  def initialize(code = Code::SUCCESS, message = '')
    @code = code
    @message = message
  end

  def self.rescue(catch_block = nil)
    response = self.new
    begin
      yield(response)
    rescue => e
      catch_block.call if catch_block.present?
      if response.code == Code::SUCCESS
        response.code = Code::ERROR
        response.message = e.message
      end
    end
    response
  end

  def self.error
    response = self.new
    response.code = Code::ERROR
    response.message = '未知异常'
    response
  end
end