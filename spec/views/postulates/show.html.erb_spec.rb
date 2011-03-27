require 'spec_helper'

describe "postulates/show.html.erb" do
  before(:each) do
    @postulate = assign(:postulate, stub_model(Postulate,
      :user_id => "",
      :uniform_link => "Uniform Link",
      :commentary => "Commentary"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Uniform Link/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Commentary/)
  end
end
