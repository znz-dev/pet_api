class AddIsAdminToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_admin, :boolean, default: false, comment: '是否为管理员'
  end
end
