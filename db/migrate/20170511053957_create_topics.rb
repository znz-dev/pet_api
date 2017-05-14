class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics, comment: '论坛板块' do |t|
      t.string :name, comment: '板块名'
      t.string :avatar, comment: '板块头像'
      t.string :post_number, comment: '板块帖子数'
      t.string :description, comment: '板块描述'

      t.timestamps
    end
  end
end
