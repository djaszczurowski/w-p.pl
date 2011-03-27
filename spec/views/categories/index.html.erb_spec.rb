require 'spec_helper'

describe "categories/index.html.erb" do
  before(:each) do
    assign(:categories, [
      stub_model(Category,
        :polish_name => "Polish Name",
        :polish_description => "Polish Description",
        :english_name => "English Name",
        :english_description => "English Description"
      ),
      stub_model(Category,
        :polish_name => "Polish Name",
        :polish_description => "Polish Description",
        :english_name => "English Name",
        :english_description => "English Description"
      )
    ])
  end

  it "renders a list of categories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Polish Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Polish Description".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "English Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "English Description".to_s, :count => 2
  end
end
