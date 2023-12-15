class CreatePublicRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :public_rooms do |t|
      t.string :name, null: false
      t.boolean :public, default: false
      t.timestamps
    end
  end
end
