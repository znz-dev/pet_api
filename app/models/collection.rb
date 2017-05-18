class Collection < ApplicationRecord
  belongs_to :resource, polymorphic: true
  belongs_to :user

  validates :user_id, :resource_type, :resource_id, presence: true
  validates :resource_id, uniqueness: { scope: [:user_id, :resource_type],
                                        message: '你已经收藏过了' }

  def self.create_collection_by_params(params)
    collection = nil
    response = Response.rescue do |res|
      collection = Collection.new(collection_params(params))
      res.error('参数错误') if collection.user.blank? || collection.resource.blank?
      collection.save!
    end
    [response, collection]
  end

  def self.delete_collection_by_params(params)
    response = Response.rescue do |res|
      collection = Collection.find_by_id(params[:id])
      res.error('不存在该收藏') if collection.blank?
      collection.destroy!
    end
    response
  end

  def self.query_collections_by_params(params)
    collections = []
    response = Response.rescue do
      search_params = params[:search] ||= {}
      search_params[:user_id] = params[:user_id] if params[:user_id].present?
      collections = Collection.search_by_params(search_params)
      collections = collections.page(params[:page] ||= 1).per(params[:per] ||= 12)
    end
    [response, collections]
  end

  def self.collection_params(params)
    params.permit(:user_id, :resource_type, :resource_id)
  end
end
