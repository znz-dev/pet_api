class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.integer :pet_id
      t.text :description

      t.timestamps
    end
  end
end
