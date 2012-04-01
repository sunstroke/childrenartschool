require 'spec_helper'

describe "live_news/index" do
  before(:each) do
    assign(:live_news, [
      stub_model(LiveNews,
        :name => "Name",
        :link => "Link",
        :img => "Img",
        :desc => "MyText",
        :position => 1,
        :visible => false
      ),
      stub_model(LiveNews,
        :name => "Name",
        :link => "Link",
        :img => "Img",
        :desc => "MyText",
        :position => 1,
        :visible => false
      )
    ])
  end

  it "renders a list of live_news" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Link".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Img".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
