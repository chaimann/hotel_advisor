module HotelsHelper

  def current_hotel
    @current_hotel = Hotel.find(params[:grade][:hotel_id])
  end

  def grade_by_user_exists?
    current_user.grades.where("hotel_id = ?", params[:id]).count > 0
  end

end
