require 'spec_helper'

describe "pflegeanbieters/new" do
  before(:each) do
    assign(:pflegeanbieter, stub_model(Pflegeanbieter,
      :name => "MyString",
      :bewertung => 1
    ).as_new_record)
  end

  it "renders new pflegeanbieter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", pflegeanbieters_path, "post" do
      assert_select "input#pflegeanbieter_name[name=?]", "pflegeanbieter[name]"
      assert_select "input#pflegeanbieter_bewertung[name=?]", "pflegeanbieter[bewertung]"
    end
  end
end
