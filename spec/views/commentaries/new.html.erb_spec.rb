require 'spec_helper'

describe "commentaries/new.html.erb" do
  before(:each) do
    assign(:commentary, stub_model(Commentary,
      :user_id => "",
      :news_id => "",
      :subject => "MyString",
      :comment => "MyString"
    ).as_new_record)
  end

  it "renders new commentary form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => commentaries_path, :method => "post" do
      assert_select "input#commentary_user_id", :name => "commentary[user_id]"
      assert_select "input#commentary_news_id", :name => "commentary[news_id]"
      assert_select "input#commentary_subject", :name => "commentary[subject]"
      assert_select "input#commentary_comment", :name => "commentary[comment]"
    end
  end
end
