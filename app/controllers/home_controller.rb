class HomeController < ApplicationController

  def index
    @templates = Template.all
    @reports = Report.recent.limit(10)
  end
end
