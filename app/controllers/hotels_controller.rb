class HotelsController < ApplicationController
  
  def index
    @hotels = Hotel.all
  end

  def new
    @hotel = Hotel.new
    @hotel.grades.build
    @hotel.address = Address.new
  end

  def create
    @hotel = Hotel.new(hotel_params)
    if @hotel.save
      flash[:success] = "Successfully created hotel #{@hotel.title}!"
      redirect_to @hotel
    else
      render 'new'
    end
  end

  def show
    @hotel = Hotel.find(params[:id])
    @grade = @hotel.grades.build
    @grade.comment = Comment.new
  end

  private

    def hotel_params
      params.require(:hotel).permit(:title, :breakfast_included, :room_description,
                                    :price, :image, :remote_image_url, grades_attributes: [:value, :user_id,
                                    :hotel_id], address_attributes: [:country, :state,
                                    :city, :street])
    end


end
