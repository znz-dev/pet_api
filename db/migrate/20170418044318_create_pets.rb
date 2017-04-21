class CreatePets < ActiveRecord::Migration[5.0]
  def change
    create_table :pets, comment: '宠物表' do |t|
      t.string :name, comment: '宠物名'
      t.string :species, comment: '物种'
      t.string :gender, comment: '宠物性别'
      t.string :status, comment: '宠物状态'
      t.integer :provider_id, comment: '关联宠物提供人'
      t.integer :adopter_id, comment: '关联宠物领养人'

      t.timestamps
    end
  end
end
