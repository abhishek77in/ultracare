require "rails_helper"

RSpec.describe ReportTypesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/report_types").to route_to("templates#index")
    end

    it "routes to #new" do
      expect(:get => "/report_types/new").to route_to("templates#new")
    end

    it "routes to #show" do
      expect(:get => "/report_types/1").to route_to("templates#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/report_types/1/edit").to route_to("templates#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/report_types").to route_to("templates#create")
    end

    it "routes to #update" do
      expect(:put => "/report_types/1").to route_to("templates#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/report_types/1").to route_to("templates#destroy", :id => "1")
    end

  end
end
