class BusinessAnalysisController < ApplicationController

  def index
    @business_analyis = BusinessAnalysis.new(business_analysis_params)
    @reports = Report.date_range(@business_analyis.date_range)

    @pie_chart_data = Hash.new
    @reports.includes(:doctor).order('doctors.name').group_by(&:doctor).each do |doctor, reports|
      @pie_chart_data.merge!({"Dr. #{doctor.name}" => reports.length})
    end

    @line_chart_data = @reports.group_by_day(:created_at).count
  end

  private
  def business_analysis_params
    params.require(:business_analysis).permit!
  end
end
