class BusinessAnalysisController < ApplicationController
  before_action :redirect_to_root, if: -> { setting.disable_business_analysis? }

  def index
    @business_analyis = BusinessAnalysis.new(business_analysis_params)
    @reports = Report.date_range(@business_analyis.date_range)

    @pie_chart_data = Hash.new
    @reports.joins(:referrer).order('referrers.name').group_by(&:referrer).each do |referrer, reports|
      @pie_chart_data.merge!({referrer.name => reports.length})
    end

    @line_chart_data = @reports.group_by_day(:created_at).count
  end

  private
  def business_analysis_params
    params.require(:business_analysis).permit!
  end
end
