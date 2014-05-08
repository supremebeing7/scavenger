class PlacesController < ApplicationController
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
      respond_to do |format|
        format.html { redirect_to @crawl, notice: "Thanks for adding #{@place.name}!" }
        format.js
      end
    else
      render new_place_path
    end
  end

  def show
    @place = Place.find(params[:id])
    @places = [@place]
    @name = @place.name
    @address = @place.address
    @hash = Gmaps4rails.build_markers(@places) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      marker.infowindow render_to_string(:partial => "/places/details", :locals => { :object => place})
      marker.json({name: place.name})
    end
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
