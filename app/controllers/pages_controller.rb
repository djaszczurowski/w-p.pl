# encoding: utf-8
class PagesController < ApplicationController
 
	#before_filter :authenticate_admin, :only => :admin
  helper_method :admin_panel

  @@pl_titles = ["Strona Główna", "O nas", "Archiwum", "Postulaty", "Kontakt"]
  @@eng_titles = ["Main", "About", "Archive", "Postulates", "Contact"]
  @@page_links = ["home", "about", "archive", "postulates", "contact"]

  def self.pl_titles
    @@pl_titles
  end

  def self.eng_titles
    @@eng_titles
  end

  def self.page_links
    @@page_links
  end

  def home
    @current_page = "Main"
    @date_length = 18
    @news_length = 40
  	@title = "Strona Główna"
    @news = News.all
  	respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @news }
    end
  end

  def about
    @current_page = "About"
  	@title = "O nas"
  end

  def archive
    @current_page = "Archive"
  	@title = "Archiwum"
  end

  def postulates
    @current_page = "Postulates"
  	@postulates = Postulate.all
  	respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @postulates }
    end
  end

  def contact
    @current_page = "Contact"
  	@title = "Kontakt"
  end  
	
  def admin_log   	
  	
  	if(session[:current_user_id] && User.find(session[:current_user_id]).privilegesLevel > 0)  		
  		@admin_panel = true
  		redirect_to news_managment_url
  	else  		
  		@admin_panel = true
  		session[:log_as_admin] = true
  		@title = "Zaloguj jako administrator"
  	end
  end
  
  def admin_panel  	
  	@admin_panel = true
  	@title = "Panel Administracyjny"
  end
    
  

end
