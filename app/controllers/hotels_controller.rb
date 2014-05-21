class HotelsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_hotel, only: [:show]

  def index
    @hotels = Hotel.all
  end

  def best
    @rate = RatingCache.order(avg: :desc).limit(5)
  end

  def new
    @hotel = current_user.hotels.new
    @hotel.build_address
  end

  def create
    @hotel = current_user.hotels.new hotel_params
    if @hotel.save
      redirect_to @hotel
    else
      render action: 'new'
    end
  end

  def show
    @comment = current_user.comments.build
  end

  private

  def hotel_params
    params.require(:hotel).permit(:title, :breakfast_included, :room_description, :photo, :price, address_attributes: [:country, :state, :city, :street]) #add adress attribute
  end

  def find_hotel
    @hotel = Hotel.find params[:id]
  end
end
