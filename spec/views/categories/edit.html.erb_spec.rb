require 'spec_helper'

describe "categories/edit.html.erb" do
  before(:each) do
    @category = assign(:category, stub_model(Category,
      :polish_name => "MyString",
      :polish_description => "MyString",
      :english_name => "MyString",
      :english_description => "MyString"
    ))
  end

  it "renders the edit category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => categories_path(@category), :method => "post" do
      assert_select "input#category_polish_name", :name => "category[polish_name]"
      assert_select "input#category_polish_description", :name => "category[polish_description]"
      assert_select "input#category_english_name", :name => "category[english_name]"
      assert_select "input#category_english_description", :name => "category[english_description]"
    end
  end
end
