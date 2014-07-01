class RemoveCommentFromGrades < ActiveRecord::Migration
  def change
    remove_column :grades, :comment, :string
  end
end
