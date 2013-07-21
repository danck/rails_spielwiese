require 'spec_helper'

describe "pflegeanbieters/edit" do
  before(:each) do
    @pflegeanbieter = assign(:pflegeanbieter, stub_model(Pflegeanbieter,
      :name => "MyString",
      :bewertung => 1
    ))
  end

  it "renders the edit pflegeanbieter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", pflegeanbieter_path(@pflegeanbieter), "post" do
      assert_select "input#pflegeanbieter_name[name=?]", "pflegeanbieter[name]"
      assert_select "input#pflegeanbieter_bewertung[name=?]", "pflegeanbieter[bewertung]"
    end
  end
end
