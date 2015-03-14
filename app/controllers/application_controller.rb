class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def setting
    Setting.first
  end
  helper_method :setting

  private
  def redirect_to_root
    redirect_to root_path
  end
end
