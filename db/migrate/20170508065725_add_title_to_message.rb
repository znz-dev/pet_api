class AddTitleToMessage < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :title, :string, comment: '标题'
  end
end
