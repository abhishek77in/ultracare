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

  def selected_show_summary?
    if params[:search] && (params[:search][:show_summary] == 1.to_s)
      true
    else
      false
    end
  end
end

