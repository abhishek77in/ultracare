class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show]

  def index
    @doctors = Doctor.recent.paginate(:page => params[:page])
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to doctors_path, notice: 'Doctor was successfully created.'
    else
      flash.now[:alert] = "Sorry! Doctor could not be created, please fix the errors and try again."
      @doctors = Doctor.recent.paginate(:page => params[:page])
      render action: 'index'
    end
  end

  private
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    def doctor_params
      params.require(:doctor).permit(:name, :degree)
    end
end
