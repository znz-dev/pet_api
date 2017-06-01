class AddDetails2ToPets < ActiveRecord::Migration[5.0]
  def change
    add_column :pets, :requirement, :string, comment: '领养条件'
    add_column :pets, :health, :string, comment: '健康状态'
    add_column :pets, :age, :Integer, comment: '宠物年龄'
  end
end
