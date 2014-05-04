class CompletedCrawlsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  def new
    @completed_crawl = CompletedCrawl.new
  end

  def create
    if CompletedCrawl.where(user_id: params[:completed_crawl][:user_id],
                            crawl_id: params[:completed_crawl][:crawl_id]).exists?
      redirect_to current_user, notice: "You've already marked that one complete."
    else
      @completed_crawl = CompletedCrawl.new(completed_crawl_params)
      if @completed_crawl.save
        redirect_to current_user, notice: "Good job completing the scavenger hunt!"
      else
        render 'new'
      end
    end
  end

  def index
    @completed_crawls = CompletedCrawl.all
  end

  def edit
    @completed_crawl = CompletedCrawl.find(params[:id])
  end

  def update
    @completed_crawl = CompletedCrawl.find(params[:id])
    if @completed_crawl.update(completed_crawl_params)
      redirect_to @completed_crawl
    else
      render 'edit'
    end
  end

  def destroy
    @completed_crawl = CompletedCrawl.find(params[:id])
    @completed_crawl.destroy
    redirect_to completed_crawls_path, notice: "Changed back to 'Not Done.'"
  end

private

  def completed_crawl_params
    params.require(:completed_crawl).permit(:user_id, :crawl_id)
  end

end
