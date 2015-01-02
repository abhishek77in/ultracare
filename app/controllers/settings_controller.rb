class SettingsController < ApplicationController
  before_action :set_setting

  def edit
  end

  def update
    if @setting.update(setting_params)
      redirect_to edit_setting_path, notice: 'Setting were updated successfully.'
    else
      flash.now[:alert] = "Sorry! Setting could not be updated, please fix the errors and try again."
      render action: 'edit'
    end
  end

  private
  def set_setting
    @setting = Setting.find(params[:id])
  end

  def setting_params
    params.require(:setting).permit!
  end
end
