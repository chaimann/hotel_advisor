class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :value
      t.string :comment
      t.integer :hotel_id
      t.integer :user_id

      t.timestamps
    end
  end
end
