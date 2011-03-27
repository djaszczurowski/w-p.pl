require 'spec_helper'

describe CategoriesController do

  describe "GET 'categories'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

 
end