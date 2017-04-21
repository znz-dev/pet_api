class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users, comment: '用户表' do |t|
      t.string :username, comment: '用户名'
      t.string :password, comment: '密码'
      t.string :real_name, comment: '真实姓名'
      t.string :phone, comment: '手机号码'
      t.string :email, comment: '邮箱地址'

      t.timestamps
    end
  end
end
