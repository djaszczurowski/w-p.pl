require 'spec_helper'

describe "categories/new.html.erb" do
  before(:each) do
    assign(:category, stub_model(Category,
      :polish_name => "MyString",
      :polish_description => "MyString",
      :english_name => "MyString",
      :english_description => "MyString"
    ).as_new_record)
  end

  it "renders new category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => categories_path, :method => "post" do
      assert_select "input#category_polish_name", :name => "category[polish_name]"
      assert_select "input#category_polish_description", :name => "category[polish_description]"
      assert_select "input#category_english_name", :name => "category[english_name]"
      assert_select "input#category_english_description", :name => "category[english_description]"
    end
  end
end
