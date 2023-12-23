class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.boolean :public, default: false  # デフォルトは非公開
      t.timestamps
    end
  end
end
