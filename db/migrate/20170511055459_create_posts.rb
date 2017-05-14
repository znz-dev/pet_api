class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts, comment: '论坛帖子' do |t|
      t.integer :topic_id, comment: '板块ID'
      t.integer :user_id, comment: '发帖人ID'
      t.string :title, comment: '帖子标题'
      t.integer :reply_number, comment: '帖子回复数'

      t.timestamps
    end
  end
end
