class HomeController < ApplicationController

  def index
    @templates = Template.all
  end
end
