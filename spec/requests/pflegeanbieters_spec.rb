require 'spec_helper'

describe "Pflegeanbieters" do
  describe "GET /pflegeanbieters" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get pflegeanbieters_path
      response.status.should be(200)
    end
  end
end
