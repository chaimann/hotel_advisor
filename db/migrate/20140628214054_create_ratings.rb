class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :mark
      t.integer :user_id
      t.integer :hotel_id

      t.timestamps
    end
  end
end
