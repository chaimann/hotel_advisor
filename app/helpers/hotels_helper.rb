module HotelsHelper

  def current_hotel
    @current_hotel = Hotel.find(params[:grade][:hotel_id])
  end

  def grade_by_user_exists?
    current_user.grades.where("hotel_id = ?", params[:id]).any?
  end

  def top_five
    Grade.all.group(:hotel_id).average(:value).sort_by { |h_id, avg| avg }.last(5)
  end

end
