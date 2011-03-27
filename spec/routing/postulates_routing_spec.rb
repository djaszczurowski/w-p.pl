require "spec_helper"

describe PostulatesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/postulates" }.should route_to(:controller => "postulates", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/postulates/new" }.should route_to(:controller => "postulates", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/postulates/1" }.should route_to(:controller => "postulates", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/postulates/1/edit" }.should route_to(:controller => "postulates", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/postulates" }.should route_to(:controller => "postulates", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/postulates/1" }.should route_to(:controller => "postulates", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/postulates/1" }.should route_to(:controller => "postulates", :action => "destroy", :id => "1")
    end

  end
end
