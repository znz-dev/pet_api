class AdoptionApply < ApplicationRecord
  belongs_to :pet
  belongs_to :user
  belongs_to :provider, class_name: 'User'

  module Status
    PERMIT_PENDING = 'permit_pending'
    PERMITTED = 'permitted'
    UN_PERMITTED = 'un_permitted'
    EXPIRED = 'expired'
  end


  def self.create_adoption_apply_by_params(params)
    adoption_apply = nil
    response = Response.rescue do |res|
      adoption_apply = AdoptionApply.new(adoption_apply_params(params))
      pet = adoption_apply.pet
      user = adoption_apply.user
      res.error('参数错误') if pet.blank? || user.blank? || pet.provider.blank?
      res.error('宠物已经被领养') if pet.adopter.present?
      adoption_apply.provider = pet.provider
      adoption_apply.status = Status::PERMIT_PENDING
      adoption_apply.save!
    end
    [response, adoption_apply]
  end

  def self.get_adoption_apply_by_id(params)
    adoption_apply = nil
    response = Response.rescue do |res|
      adoption_apply = AdoptionApply.find_by_id(params[:id])
      res.error('不存在该申请') if adoption_apply.blank?
    end
    [response, adoption_apply]
  end

  def self.update_adoption_apply_by_params(params)
    adoption_apply = nil
    response = Response.rescue do |res|
      adoption_apply = AdoptionApply.find_by_id(params[:id])
      res.error('审批不存在') if adoption_apply.blank?
      res.error('不能审批') if adoption_apply.status != Status::PERMIT_PENDING || adoption_apply.pet.adopter.present?
      case params[:status]
        when Status::PERMITTED
          AdoptionApply.permit_adoption(adoption_apply.id)
        when Status::UN_PERMITTED
          adoption_apply.update_attributes!(status: Status::UN_PERMITTED)
        else
          res.error('错误')
      end
    end
    [response, adoption_apply]
  end

  def self.get_adoption_applies_by_params(params)
    adoption_applies = []
    response = Response.rescue do |res|
      search_params = params[:search]
      adoption_applies = AdoptionApply.search_by_params(search_params)
      adoption_applies = adoption_applies.includes(:pet, :user, :provider)
      adoption_applies = adoption_applies.page(params[:page] ||= 1).per(params[:per] ||= 12)
    end
    [response, adoption_applies]
  end

  def self.permit_adoption(adoption_id)
    adoption_apply = AdoptionApply.find_by_id(adoption_id)
    pet = adoption_apply.pet
    if pet.adopter.blank?
      AdoptionApply.transaction do
        pet.update_attributes!(adopter: adoption_apply.user)
        adoption_apply.update_attributes!(status: Status::PERMITTED)
        AdoptionApply.where(pet: pet).where(status: Status::PERMIT_PENDING).update(status: Status::EXPIRED)
      end
    end
  end

  def self.adoption_apply_params(params)
    params.permit(:pet_id, :user_id, :content)
  end
end
