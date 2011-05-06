# encoding: utf-8
class CategoriesController < ApplicationController
	
  before_filter :authorize, :only => [:index, :destroy, :new]
  layout :get_users_layout
  
  @@per_page = ApplicationController.get_view_settings.categories_per_page

  

  def self.per_page
    @@per_page
  end

  # GET /categories
  # GET /categories.xml
  def index
  	if params[:sort_type]
    	@categories = Category.all(:order => params[:sort_type].to_s)
    else
    	@categories = Category.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.xml
  def show
    @category = Category.find(params[:id])
	@category_news = News.where(:category_id => @category.id)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @category }
    end
  end

  # GET /categories/new
  # GET /categories/new.xml
  def new
    @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @category }
    end
  end

  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])
  end

  # POST /categories
  # POST /categories.xml
  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to(@category, :notice => 'Category was successfully created.') }
        format.xml  { render :xml => @category, :status => :created, :location => @category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.xml
  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to(@category, :notice => 'Category was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.xml
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to(categories_url) }
      format.xml  { head :ok }
    end
  end
  
  def get_users_layout
  	if(action_name != "show")
  		"admin_panel"
  	else
  		"application"
  	end
  end
end
