class ReportsController < ApplicationController

  def new
    @report = Report.new
    @place = Place.find(params[:id])
    @user = current_user
  end

  def create
    @report = Report.new(report_params)
    if @report.save
      flash[:notice] = "Thanks for reporting #{@report.place.name}!"
      redirect_to @report.place
    else
      render new_report_path
    end
  end

private
  def report_params
    params.require(:report).permit(:place_id, :user_id, :description)
  end
end
