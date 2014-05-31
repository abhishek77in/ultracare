class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :edit, :update]

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

  def edit
    @doctors = Doctor.recent.paginate(:page => params[:page])
    render 'index'
  end

  def update
    if @doctor.update_attributes(doctor_params)
      redirect_to doctors_path, notice: 'Doctor details were updated successfully.'
    else
      flash.now[:alert] = "Sorry! Doctor details could not be updated, please fix the errors and try again."
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
