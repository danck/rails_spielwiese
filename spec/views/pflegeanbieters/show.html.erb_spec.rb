require 'spec_helper'

describe "pflegeanbieters/show" do
  before(:each) do
    @pflegeanbieter = assign(:pflegeanbieter, stub_model(Pflegeanbieter,
      :name => "Name",
      :bewertung => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
  end
end
