class ReportsController < ApplicationController

  load_and_authorize_resource

  def new
    @client = Client.find_by(params[:client_id])
    # @chef = Chef.find_by(params[:id])
    @report = Report.new
  end

  def create
    @client = Client.find_by(params[:client_id])
    @report = Report.new(report_params)

    if @report.save
      flash[:notice] = "A report was successfully created"
      redirect_to client_profile_path(@client.id)
    else
      flash[:error] = "There are some errors encountered"
      render :new
    end
  end

  def report_params
    params.require(:report).permit(:chef_id, :client_id, :message)
  end
end
