class GradesController < ApplicationController

  def create
    @grade = current_hotel.grades.build(grade_params)
    if @grade.save
      redirect_to current_hotel
    else
      @hotel = @grade.hotel
      redirect_to current_hotel
    end    
  end

  private

  def grade_params
    params.require(:grade).permit(:value, :user_id, :hotel_id,
                                  comment_attributes: [:content, :grade_id,
                                  :user_id, :hotel_id])
  end
end
