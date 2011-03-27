require 'spec_helper'

describe "postulates/edit.html.erb" do
  before(:each) do
    @postulate = assign(:postulate, stub_model(Postulate,
      :user_id => "",
      :uniform_link => "MyString",
      :commentary => "MyString"
    ))
  end

  it "renders the edit postulate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => postulates_path(@postulate), :method => "post" do
      assert_select "input#postulate_user_id", :name => "postulate[user_id]"
      assert_select "input#postulate_uniform_link", :name => "postulate[uniform_link]"
      assert_select "input#postulate_commentary", :name => "postulate[commentary]"
    end
  end
end
