class ReportsController < ApplicationController

  def new
    @report = Report.new
    @place = Place.find(params[:pid]) if params[:pid]
    @crawl = Crawl.find(params[:cid]) if params[:cid]
    @user = current_user
  end

  def create
    @report = Report.new(report_params)
    if @report.save
      if @report.place_id
        flash[:success] = "Thanks for reporting #{@report.place.name}!"
        redirect_to @report.place
      else
        flash[:success] = "Thanks for reporting #{@report.crawl.name}!"
        redirect_to @report.crawl
      end
    else
      redirect_to new_report_path
    end
  end

private
  def report_params
    params.require(:report).permit(:place_id, :crawl_id, :user_id, :description)
  end
end
