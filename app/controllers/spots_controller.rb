class SpotsController < ApplicationController

  def index
    @spots = Spot.all
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    if @spot.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def spot_params
    params.require(:post).permit(:name, :address, :latitude, :longitude, tag_ids: []).merge(user_id: current_user.id)
  end
  
end
