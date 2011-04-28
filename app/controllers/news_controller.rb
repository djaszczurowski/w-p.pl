# encoding: utf-8
class NewsController < ApplicationController
  include ActionView::Helpers::SanitizeHelper
  
  before_filter :authorize, :only => [:index, :delete]
  layout :get_news_layout
  
  helper_method :change_is_showing_comments
  helper_method :is_showing_comments
   

  def show_comments
    cookies[:comm] = "yes"
    redirect_to "/news/" + params[:id] + "#comments_begin"
  end

  def hide_comments
    cookies[:comm] = "no"
    redirect_to "/news/" + params[:id]
  end

  def change_is_showing_comments
    if cookies[:comm] == "yes"
      cookies[:comm] = "no"
      redirect_to "/news/" + params[:id]
    else
      cookies[:comm] = "yes"
      redirect_to "/news/" + params[:id] + "#comments_begin"
    end
  end

  def is_showing_comments
    return cookies[:comm] == "yes"
  end

  def add_comment
    if !params[:title].to_s.blank? && !params[:content].to_s.blank? 
      @comment = Comment.new

      @comment.user_id = session[:current_user_id]
      @comment.news_id = params[:id]
      @comment.posted = Time.now()
      @comment.subject = params[:title]
      @comment.comment = params[:content] 

      @comment.save
    else

    end
    cookies[:comm] = "yes"
    redirect_to "/news/" + params[:id] + "#comments_begin"
  end

	
  # GET /news
  # GET /news.xml
  def index
    @news = News.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @news }
    end
  end

  # GET /news/1
  # GET /news/1.xml
  def filter_news
    @news = News.where(:user_id => params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @news }
    end
  end

  
  def show
    @news = News.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @news }
    end
  end


  # GET /news/new
  # GET /news/new.xml
  def new
  	if is_admin_logged
  		@admin_panel = true
	    @news = News.new	
	    respond_to do |format|
	      format.html # new.html.erb
	      format.xml  { render :xml => @news }
	    end
	   
	 else
	 	flash.now[:error] = "Zaloguj sie jako administrator"
	 	redirect_to root_url	 	
	 end
  end

  # GET /news/1/edit
  def edit
  	if is_admin_logged
  		@admin_panel = true
    	@news = News.find(params[:id])
   else
   		flash.now[:error] = "Zaloguj sie jako administrator"
	 	redirect_to root_url	  	
	 end
  end

  # POST /news
  # POST /news.xml
  def create
    @news = News.new(params[:news])

    respond_to do |format|
      if @news.save
        format.html { redirect_to(@news, :notice => 'News was successfully created.') }
        format.xml  { render :xml => @news, :status => :created, :location => @news }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @news.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /news/1
  # PUT /news/1.xml
  def update
    @news = News.find(params[:id])

    respond_to do |format|
      if @news.update_attributes(params[:news])
        format.html { redirect_to(@news, :notice => 'News was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @news.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.xml
  def destroy
  	if is_admin_logged
	    @news = News.find(params[:id])
	    @news.destroy
	
	    respond_to do |format|
	      format.html { redirect_to(news_index_url) }
	      format.xml  { head :ok }
	    end
   	else
   		flash.now[:error] = "Zaloguj sie jako administrator"
	 	redirect_to root_url	 	
	 end
  end  
  
  def get_news_layout
  	if(action_name == "show" || action_name == "filter_news")
  		"application"
  	else
  		"admin_panel"
  	end
  end
  
  @@per_page =  ApplicationController.get_view_settings.news_per_page
  def self.per_page
  	@@per_page 
  end
  
end
