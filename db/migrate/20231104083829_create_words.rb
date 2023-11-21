class CreateWords < ActiveRecord::Migration[7.0]
  def change
    create_table :words do |t|
      t.string  :content
      t.string  :person
      t.string  :source
      t.references :room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
