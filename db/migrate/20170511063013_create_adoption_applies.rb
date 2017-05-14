class CreateAdoptionApplies < ActiveRecord::Migration[5.0]
  def change
    create_table :adoption_applies, comment: '领养申请' do |t|
      t.integer :pet_id, comment: '宠物ID'
      t.integer :user_id, comment: '领养申请人ID'
      t.integer :provider_id, comment: '宠物提供人ID'
      t.string :status, comment: '申请状态'
      t.text :content, comment: '申请理由'

      t.timestamps
    end
  end
end
