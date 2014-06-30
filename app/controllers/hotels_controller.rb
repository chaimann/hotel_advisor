class HotelsController < ApplicationController
  
  def new
    @hotel = Hotel.new
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
  end

  private

    def hotel_params
      params.require(:hotel).permit(:title, :breakfast_included,
                                   :room_description, :price)
    end


end
