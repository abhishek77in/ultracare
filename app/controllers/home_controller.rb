class HomeController < ApplicationController

  def index
    @templates = Template.ordered
    @reports = Report.recent.limit(10).decorate
    @draft_reports = Report.recent.drafts.limit(10).decorate
  end
end
