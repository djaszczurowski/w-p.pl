require 'spec_helper'

describe "news/show.html.erb" do
  before(:each) do
    @news = assign(:news, stub_model(News,
      :user_id => "",
      :category_id => "",
      :polish_subject => "Polish Subject",
      :polish_news => "Polish News",
      :english_subject => "English Subject",
      :english_news => "English News"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Polish Subject/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Polish News/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/English Subject/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/English News/)
  end
end
