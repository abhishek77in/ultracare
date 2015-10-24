require 'rails_helper'

RSpec.describe "Templates", type: :request do
  describe "GET /report_types" do
    it "works! (now write some real specs)" do
      skip
      get templates_path
      expect(response).to have_http_status(200)
    end
  end
end
