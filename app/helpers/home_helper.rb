module HomeHelper

  def selected_doctor_id
    params[:search][:doctor_id] if params[:search]
  end
end

