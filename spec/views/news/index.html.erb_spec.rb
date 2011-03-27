require 'spec_helper'

describe "news/index.html.erb" do
  before(:each) do
    assign(:news, [
      stub_model(News,
        :user_id => "",
        :category_id => "",
        :polish_subject => "Polish Subject",
        :polish_news => "Polish News",
        :english_subject => "English Subject",
        :english_news => "English News"
      ),
      stub_model(News,
        :user_id => "",
        :category_id => "",
        :polish_subject => "Polish Subject",
        :polish_news => "Polish News",
        :english_subject => "English Subject",
        :english_news => "English News"
      )
    ])
  end

  it "renders a list of news" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Polish Subject".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Polish News".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "English Subject".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "English News".to_s, :count => 2
  end
end
