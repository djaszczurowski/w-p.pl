require 'spec_helper'

describe "commentaries/index.html.erb" do
  before(:each) do
    assign(:commentaries, [
      stub_model(Commentary,
        :user_id => "",
        :news_id => "",
        :subject => "Subject",
        :comment => "Comment"
      ),
      stub_model(Commentary,
        :user_id => "",
        :news_id => "",
        :subject => "Subject",
        :comment => "Comment"
      )
    ])
  end

  it "renders a list of commentaries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Comment".to_s, :count => 2
  end
end
