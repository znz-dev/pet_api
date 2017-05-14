class CreateCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :collections, comment: '收藏' do |t|
      t.integer :user_id, comment: '用户ID'
      t.string :resource_type, comment: '关联类型'
      t.integer :resource_id, comment: '关联ID'

      t.timestamps
    end
  end
end
