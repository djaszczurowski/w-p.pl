# encoding: utf-8
class PostulatesController < ApplicationController

	layout "admin_panel", :only => [:edit, :index]
	layout "application", :except => [:edit, :index]
	
	before_filter :is_admin_logged, :only => :edit

  @@per_page = 2

  def self.per_page
    @@per_page
  end

  # GET /postulates
  # GET /postulates.xml
  def index
    @postulates = Postulate.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @postulates }
    end
  end

  def filter_postulates
    @postulates = Postulate.where(:user_id => params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @postulates }
    end
  end
  
  # GET /postulates/1
  # GET /postulates/1.xml
  def show
    @postulate = Postulate.find(params[:id])
    @admin_panel = true
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @postulate }
    end
  end

  # GET /postulates/new
  # GET /postulates/new.xml
  def new
    @postulate = Postulate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @postulate }
    end
  end

  # GET /postulates/1/edit
  def edit
    @postulate = Postulate.find(params[:id])
  end

  # POST /postulates
  # POST /postulates.xml
  def create
    @postulate = Postulate.new(params[:postulate])

    respond_to do |format|
      if @postulate.save
        format.html { redirect_to(@postulate, :notice => 'Postulate was successfully created.') }
        format.xml  { render :xml => @postulate, :status => :created, :location => @postulate }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @postulate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /postulates/1
  # PUT /postulates/1.xml
  def update
    @postulate = Postulate.find(params[:id])

    respond_to do |format|
      if @postulate.update_attributes(params[:postulate])
        format.html { redirect_to(@postulate, :notice => 'Postulate was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @postulate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /postulates/1
  # DELETE /postulates/1.xml
  def destroy
    @postulate = Postulate.find(params[:id])
    @postulate.destroy

    respond_to do |format|
      format.html { redirect_to(postulates_url) }
      format.xml  { head :ok }
    end
  end
end
