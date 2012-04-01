require 'spec_helper'

describe "live_news/new" do
  before(:each) do
    assign(:live_news, stub_model(LiveNews,
      :name => "MyString",
      :link => "MyString",
      :img => "MyString",
      :desc => "MyText",
      :position => 1,
      :visible => false
    ).as_new_record)
  end

  it "renders new live_news form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => live_news_index_path, :method => "post" do
      assert_select "input#live_news_name", :name => "live_news[name]"
      assert_select "input#live_news_link", :name => "live_news[link]"
      assert_select "input#live_news_img", :name => "live_news[img]"
      assert_select "textarea#live_news_desc", :name => "live_news[desc]"
      assert_select "input#live_news_position", :name => "live_news[position]"
      assert_select "input#live_news_visible", :name => "live_news[visible]"
    end
  end
end
