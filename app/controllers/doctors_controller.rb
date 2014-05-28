class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show]

  # GET /doctors
  # GET /doctors.json
  def index
    @doctors = Doctor.recent.paginate(:page => params[:page])
    @doctor = Doctor.new
  end

  # GET /doctors/1
  # GET /doctors/1.json
  def show
  end

  # GET /doctors/new
  def new
    @doctor = Doctor.new
  end

  # POST /doctors
  # POST /doctors.json
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
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doctor_params
      params.require(:doctor).permit(:name, :degree)
    end
end
