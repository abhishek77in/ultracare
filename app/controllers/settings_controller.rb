class SettingsController < ApplicationController
  before_action :set_setting, only: [:edit, :update]

  def edit
  end

  def update
    @setting.print_settings = setting_params
    if @setting.save
      redirect_to settings_edit_path, notice: 'Setting details were updated successfully.'
    else
      flash.now[:alert] = "Sorry! Setting details could not be updated, please fix the errors and try again."
      render action: 'edit'
    end
  end

  private
  def set_setting
    @setting = Setting.first
  end

  def setting_params
    params.require(:setting).permit!
  end
end
