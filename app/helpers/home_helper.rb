module HomeHelper

  def selected_doctor_id
    params[:search][:doctor_id] if params[:search]
  end

  def selected_date_range
    params[:search][:date_range] if params[:search]
  end
end

