class GradesController < ApplicationController

  def create
    @grade = current_hotel.grades.build(grade_params)
    if @grade.save
      redirect_to current_hotel
    end    
  end

  private

  def grade_params
    params.require(:grade).permit(:value, :comment, :user_id, :hotel_id)
  end
end
