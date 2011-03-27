require "spec_helper"

describe CommentariesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/commentaries" }.should route_to(:controller => "commentaries", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/commentaries/new" }.should route_to(:controller => "commentaries", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/commentaries/1" }.should route_to(:controller => "commentaries", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/commentaries/1/edit" }.should route_to(:controller => "commentaries", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/commentaries" }.should route_to(:controller => "commentaries", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/commentaries/1" }.should route_to(:controller => "commentaries", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/commentaries/1" }.should route_to(:controller => "commentaries", :action => "destroy", :id => "1")
    end

  end
end
