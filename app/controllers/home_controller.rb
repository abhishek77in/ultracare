class HomeController < ApplicationController

  def index
    @reports = Report.last(50)
  end
end
