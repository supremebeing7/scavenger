class CrawlsController < ApplicationController
  include Maps

  before_filter :authenticate_user!, except: [:index, :show]
  def new
    @crawl = Crawl.new
  end

  def create
    @crawl = Crawl.new(crawl_params)
    if @crawl.save
      redirect_to current_user, success: "Crawl Added."
    else
      render 'new'
    end
  end

  def index
    @crawls = Crawl.all
  end

  def show
    @report = Report.new
    @crawl = Crawl.find(params[:id])
    if current_user
      @completed_crawl = CompletedCrawl.new(user_id: current_user.id, crawl_id: @crawl.id)
    else
      @completed_crawl = CompletedCrawl.new
    end
    build_map_markers(@crawl.places)
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
    redirect_to crawls_path, success: "Crawl Deleted."
  end

private

  def crawl_params
    params.require(:crawl).permit(:name, :description, :user_id, :public)
  end

end
