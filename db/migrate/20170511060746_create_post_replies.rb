class CreatePostReplies < ActiveRecord::Migration[5.0]
  def change
    create_table :post_replies, comment: '帖子回复' do |t|
      t.integer :post_id, comment: '帖子ID'
      t.text :content, comment: '回复内容'
      t.integer :no, comment: '楼层数'
      t.integer :user_id, comment: '回复人ID'

      t.timestamps
    end
  end
end
