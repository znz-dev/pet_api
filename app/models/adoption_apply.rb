class AdoptionApply < ApplicationRecord
  belongs_to :pet
  belongs_to :user
  belongs_to :provider, class_name: 'User'

  Module Status


  def self.create_adoption_apply_by_params(params)
    adoption_apply = nil
    response = Response.rescue do |res|
      adoption_apply = AdoptionApply.new(adoption_apply_params(params))
      pet = adoption_apply.pet
      user = adoption_apply.user
      res.error('参数错误') if pet.blank? || user.blank? || pet.provider.blank?
      res.error('宠物已经被领养') if pet.adopter.present?
      adoption_apply.provider = pet.provider
      adoption_apply.save!
    end
    [response, adoption_apply]
  end

  def self.update_adoption_apply_by_params(params)
    adoption_apply = nil
    response = Response.rescue do |res|

    end
  end

  def self.adoption_apply_params(params)
    params.permit(:pet_id, :user_id, :content)
  end
end
