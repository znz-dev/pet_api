class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages, comment: '消息表' do |t|
      t.integer :sender_id, comment: '发送者'
      t.integer :receiver_id, comment: '接收者'
      t.string :content, comment: '内容'
      t.string :status, default: :unread, comment: '状态'

      t.timestamps
    end
  end
end
