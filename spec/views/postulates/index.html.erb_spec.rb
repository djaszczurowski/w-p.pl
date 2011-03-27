require 'spec_helper'

describe "postulates/index.html.erb" do
  before(:each) do
    assign(:postulates, [
      stub_model(Postulate,
        :user_id => "",
        :uniform_link => "Uniform Link",
        :commentary => "Commentary"
      ),
      stub_model(Postulate,
        :user_id => "",
        :uniform_link => "Uniform Link",
        :commentary => "Commentary"
      )
    ])
  end

  it "renders a list of postulates" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Uniform Link".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Commentary".to_s, :count => 2
  end
end
