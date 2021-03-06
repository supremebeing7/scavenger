class PlacesController < ApplicationController
  include Maps

  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @places = Place.all
  end

  def new
    @place = Place.new
    @crawl = Crawl.find(params[:crawl_id])
  end

  def create
    @crawl = Crawl.find(params[:place][:crawl_id])
    @place = Place.new(place_params)
    if @place.save
      @crawl.places << @place if @crawl
      redirect_to @crawl, success: "Thanks for adding #{@place.name}!"
    else
      render new_place_path
    end
  end

  def show
    @report = Report.new
    @place = Place.find(params[:id])
    build_map_markers([place])
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    if @place.update(place_params)
      flash[:success] = "Thanks for the update to #{@place.name}!"
      redirect_to place_path(@place)
    else
      flash[:danger] = 'Failed to Update'
      render edit_place_path(@place)
    end
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to :back, success: "Place Deleted"
  end

private
  def place_params
    params.require(:place).permit(:name, :address, :description, :phone, :website)
  end
end
