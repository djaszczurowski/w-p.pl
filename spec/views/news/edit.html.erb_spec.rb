require 'spec_helper'

describe "news/edit.html.erb" do
  before(:each) do
    @news = assign(:news, stub_model(News,
      :user_id => "",
      :category_id => "",
      :polish_subject => "MyString",
      :polish_news => "MyString",
      :english_subject => "MyString",
      :english_news => "MyString"
    ))
  end

  it "renders the edit news form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => news_index_path(@news), :method => "post" do
      assert_select "input#news_user_id", :name => "news[user_id]"
      assert_select "input#news_category_id", :name => "news[category_id]"
      assert_select "input#news_polish_subject", :name => "news[polish_subject]"
      assert_select "input#news_polish_news", :name => "news[polish_news]"
      assert_select "input#news_english_subject", :name => "news[english_subject]"
      assert_select "input#news_english_news", :name => "news[english_news]"
    end
  end
end
