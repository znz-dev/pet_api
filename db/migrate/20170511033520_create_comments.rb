class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments, comment: '留言板' do |t|
      t.integer :pet_id, comment: '宠物ID'
      t.integer :user_id, comment: '用户ID'
      t.text :content, comment: '留言内容'

      t.timestamps
    end
  end
end
