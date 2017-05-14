class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news, comment: '首页新闻' do |t|
      t.string :resource_type, comment: '关联类型'
      t.integer :resource_id, comment: '关联ID'
      t.string :poster, comment: '新闻海报'

      t.timestamps
    end
  end
end
