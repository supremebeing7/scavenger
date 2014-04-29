class PlacesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      flash[:notice] = "Thanks for adding #{@place.name}!"
      redirect_to @place
    else
      render new_place_path
    end
  end

  def show
    @place = Place.find(params[:id])
    @name = @place.name
    @address = @place.address
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    if @place.update(place_params)
      flash[:notice] = "Thanks for the update to #{@place.name}!"
      redirect_to place_path(@place)
    else
      flash[:notice] = 'Failed to Update'
      render edit_place_path(@place)
    end
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    flash[:notice] = "Account Deleted"
    redirect_to places_path
  end

private
  def place_params
    params.require(:place).permit(:name, :address, :description, :phone, :website)
  end
end
