require 'spec_helper'

describe "categories/show.html.erb" do
  before(:each) do
    @category = assign(:category, stub_model(Category,
      :polish_name => "Polish Name",
      :polish_description => "Polish Description",
      :english_name => "English Name",
      :english_description => "English Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Polish Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Polish Description/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/English Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/English Description/)
  end
end
