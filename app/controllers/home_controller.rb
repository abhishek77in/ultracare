class HomeController < ApplicationController

  def index
    @report_types = ReportType.all
    @reports = Report.recent.limit(10)
  end
end
