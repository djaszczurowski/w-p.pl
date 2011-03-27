require 'spec_helper'

describe "commentaries/show.html.erb" do
  before(:each) do
    @commentary = assign(:commentary, stub_model(Commentary,
      :user_id => "",
      :news_id => "",
      :subject => "Subject",
      :comment => "Comment"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Subject/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Comment/)
  end
end
