module HotelsHelper

  def current_hotel
    @current_hotel = Hotel.find(params[:grade][:hotel_id])
  end

  def grade_by_user_exists?
    current_user.grades.where("hotel_id = ?", params[:id]).any?
  end

  def top_five
    Hotel.joins(:grades).group('hotels.id').select('hotels.*, AVG(grades.value) AS avg_rating').order('avg_rating desc').limit(5)
  end

end
