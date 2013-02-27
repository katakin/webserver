require 'spec_helper'

describe "ForecastTodays" do
  describe "GET /forecast_todays" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get forecast_todays_path
      response.status.should be(200)
    end
  end
end
