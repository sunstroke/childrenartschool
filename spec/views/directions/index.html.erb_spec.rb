require 'spec_helper'

describe "directions/index" do
  before(:each) do
    assign(:directions, [
      stub_model(Direction,
        :name => "Name",
        :link => "Link",
        :img => "Img",
        :desc => "MyText"
      ),
      stub_model(Direction,
        :name => "Name",
        :link => "Link",
        :img => "Img",
        :desc => "MyText"
      )
    ])
  end

  it "renders a list of directions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Link".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Img".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
