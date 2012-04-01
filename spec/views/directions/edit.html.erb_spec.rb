require 'spec_helper'

describe "directions/edit" do
  before(:each) do
    @direction = assign(:direction, stub_model(Direction,
      :name => "MyString",
      :link => "MyString",
      :img => "MyString",
      :desc => "MyText"
    ))
  end

  it "renders the edit direction form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => directions_path(@direction), :method => "post" do
      assert_select "input#direction_name", :name => "direction[name]"
      assert_select "input#direction_link", :name => "direction[link]"
      assert_select "input#direction_img", :name => "direction[img]"
      assert_select "textarea#direction_desc", :name => "direction[desc]"
    end
  end
end
