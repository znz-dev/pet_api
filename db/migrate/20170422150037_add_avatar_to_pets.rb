class AddAvatarToPets < ActiveRecord::Migration[5.0]
  def change
    add_column :pets, :avatar, :string, comment: '头像'
  end
end
