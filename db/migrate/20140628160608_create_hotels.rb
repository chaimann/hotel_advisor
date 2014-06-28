class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :title
      t.integer :rating
      t.boolean :breakfast_included
      t.string :room_description
      t.decimal :price

      t.timestamps
    end
  end
end
