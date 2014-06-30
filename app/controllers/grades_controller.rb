class GradesController < ApplicationController

  def create
    # @grade = Grade.new(grade_params)
    # if @grade.save

    # end    
  end

  private

  def grade_params
    params.require(:grade).permit(:value, :comment, :user_id)
  end
end
