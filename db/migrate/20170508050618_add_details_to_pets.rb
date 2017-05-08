class AddDetailsToPets < ActiveRecord::Migration[5.0]
  def change
    add_column :pets, :liked, :int, default: 0, comment: '收藏数'
    add_column :pets, :location, :string, comment: '所在地'
  end
end
