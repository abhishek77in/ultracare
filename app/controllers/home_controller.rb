class HomeController < ApplicationController

  def index
    @reports = Report.recent
    @reports = @reports.belongs_to_doctor(doctor_id_param) if params[:search] && doctor_id_param.present?
    # @reports = @reports.of_date_range(params[:search][:doctor_id]) if params[:search][:doctor_id]
    @reports = @reports.paginate(:page => params[:page])
  end

  private
  def doctor_id_param
    params.require(:search).permit(:doctor_id)[:doctor_id]
  end
end
