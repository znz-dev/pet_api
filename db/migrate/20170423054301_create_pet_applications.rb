class CreatePetApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :pet_applications, comment: '宠物申请' do |t|
      t.string :category, comment: '申请类别'
      t.string :user_id, comment: '申请人'
      t.string :pet_id, comment: '申请宠物'
      t.text :description, comment: '申请描述'

      t.timestamps
    end
  end
end
