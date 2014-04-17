class HomeController < ApplicationController

  def index
    @reports = Report.order('created_at DESC').last(50)
  end
end
