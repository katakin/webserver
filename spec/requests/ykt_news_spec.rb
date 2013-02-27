require 'spec_helper'

describe "YktNews" do
  describe "GET /ykt_news" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get ykt_news_path
      response.status.should be(200)
    end
  end
end
