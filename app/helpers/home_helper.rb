module HomeHelper

  def selected_patient_name
    params[:search][:patient_name] if params[:search]
  end

  def selected_doctor_id
    params[:search][:doctor_id] if params[:search]
  end

  def selected_date_range
    params[:search][:date_range] if params[:search]
  end
end

