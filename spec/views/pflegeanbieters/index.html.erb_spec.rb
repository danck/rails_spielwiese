require 'spec_helper'

describe "pflegeanbieters/index" do
  before(:each) do
    assign(:pflegeanbieters, [
      stub_model(Pflegeanbieter,
        :name => "Name",
        :bewertung => 1
      ),
      stub_model(Pflegeanbieter,
        :name => "Name",
        :bewertung => 1
      )
    ])
  end

  it "renders a list of pflegeanbieters" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
