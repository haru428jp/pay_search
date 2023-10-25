class SpotsController < ApplicationController

  def index
    @spots = Spot.all
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    result = Geocoder.search(@spot.address).first
  
    if result
      @spot.latitude = result.latitude
      @spot.longitude = result.longitude
    end
  
    if @spot.save
      redirect_to root_path
    else
      if result
        render :new, status: :unprocessable_entity
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def show
    @spot = Spot.find(params[:id])
  end

  private

  def spot_params
    params.require(:spot).permit(:name, :address, :latitude, :longitude, tag_ids: []).merge(user_id: current_user.id)
  end
  
end
