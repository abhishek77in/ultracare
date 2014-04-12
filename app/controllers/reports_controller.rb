class ReportsController < ApplicationController
  def new
    @report = Report.new
    @report.report_type = ReportType.new(reportable: WholeAbdomen.new)
  end

  def create
  end
end
