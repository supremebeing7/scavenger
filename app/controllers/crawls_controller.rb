class CrawlsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  def new
    @crawl = Crawl.new
  end

  def create
    @crawl = Crawl.new(crawl_params)
    if @crawl.save
      redirect_to current_user, notice: "Crawl Added."
    else
      render 'new'
    end
  end

  def index
    @crawls = Crawl.all
  end

  def show
    @crawl = Crawl.find(params[:id])
    @completed_crawl = CompletedCrawl.new
    @hash = Gmaps4rails.build_markers(@crawl.places) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      marker.infowindow render_to_string(:partial => "/places/details", :locals => { :object => place})
      marker.json({name: place.name})
    end
  end

  def edit
    @crawl = Crawl.find(params[:id])
  end

  def update
    @crawl = Crawl.find(params[:id])
    if @crawl.update(crawl_params)
      redirect_to @crawl
    else
      render 'edit'
    end
  end

  def destroy
    @crawl = crawl.find(params[:id])
    @crawl.destroy
    redirect_to crawls_path, notice: "Crawl Deleted."
  end

private

  def crawl_params
    params.require(:crawl).permit(:name, :description, :user_id, :public)
  end

end
