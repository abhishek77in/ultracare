class HomeController < ApplicationController

  def index
    @reports = Report.recent.paginate(:page => params[:page])
  end
end
