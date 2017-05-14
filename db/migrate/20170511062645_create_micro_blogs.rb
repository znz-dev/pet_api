class CreateMicroBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :micro_blogs, comment: '宠物动态' do |t|
      t.integer :pet_id, comment: '宠物ID'
      t.integer :user_id, comment: '用户ID'
      t.text :content, comment: '动态内容'

      t.timestamps
    end
  end
end
