class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :comment
      t.integer :user_id
      t.integer :hotel_id

      t.timestamps
    end
  end
end
