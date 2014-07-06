class GradesController < ApplicationController

  def create
    @grade = current_hotel.grades.build(grade_params)
    @grade.save
    if @grade.errors.any?
      flash[:danger] = ""
      @grade.errors.full_messages.each { |msg| flash[:danger] << "#{msg}; " }
    else
      flash[:success] = "Thanks for your feedback!"
    end
    redirect_to current_hotel
  end

  private

  def grade_params
    params.require(:grade).permit(:value, :user_id, :hotel_id,
                                  comment_attributes: [:content, :grade_id,
                                  :user_id, :hotel_id])
  end
end
