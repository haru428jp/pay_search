class SpotsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]

  def index
    if params[:sort] == 'new_comments'
      @spots = Spot.includes([:comments,:user]).order('comments.created_at DESC')
    else
      @spots = Spot.includes([:comments,:user]).order('created_at DESC')
    end
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
    @comment = Comment.new
    @comments = @spot.comments.includes(:user)
  end

  def edit
  end

  def update
    result = Geocoder.search(@spot.address).first
  
    if result
      @spot.latitude = result.latitude
      @spot.longitude = result.longitude
    end
  
    if @spot.update(spot_params)
      redirect_to spot_path(@spot)
    else
      if result
        render :edit, status: :unprocessable_entity
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @spot.spot_tags.destroy_all
    @spot.destroy
    redirect_to root_path
  end

  def search
    @spots = Spot.search(params[:keyword])
  end

  private

  def spot_params
    params.require(:spot).permit(:name, :address, :latitude, :longitude, tag_ids: []).merge(user_id: current_user.id)
  end

  def set_item
    @spot = Spot.find(params[:id])
  end

  def move_to_index
    unless current_user.id == @spot.user_id || current_user.admin?
      redirect_to root_path
    end
  end
  
end
