# encoding: utf-8
class PagesController < ApplicationController

 
 layout "admin_panel", :only => :admin_log
 layout "application", :except => :admin_log

	#before_filter :authenticate_admin, :only => :admin
  helper_method :admin_panel

  @@pl_titles = ["Strona Główna", "O nas", "Archiwum", "Postulaty", "Kontakt"]
  @@eng_titles = ["Main", "About", "Archive", "Postulates", "Contact"]
  @@page_links = ["/home", "/about", "/archive", "/postulates", "/contact"]
  @@date_length = ApplicationController.get_view_settings.date_length
  @@news_length = ApplicationController.get_view_settings.news_length
  @@news_on_main = ApplicationController.get_view_settings.news_on_main
  @@news_per_page = ApplicationController.get_view_settings.news_per_page
  @@contact_email = ApplicationController.get_contact_settings.email
  
  @@current_page = "/main"
  @@archive_begin_year = 2009

  def self.archive_begin_year
    @@archive_begin_year
  end

  def self.news_on_main
    @@news_on_main
  end

  def self.contact_email
    @@contact_email
  end

  def self.current_page
    @@current_page
  end

  def self.pl_titles
    @@pl_titles
  end

  def self.eng_titles
    @@eng_titles
  end

  def self.page_links
    @@page_links
  end

  def self.date_length
    @@date_length
  end

  def self.news_length
    @@news_length
  end
  
  def self.postulates_per_page_admin_panel
  	@@users_per_page = ApplicationController.get_view_settings.postulates_per_page
  end
  
  def self.users_per_page_admin_panel
  	@@users_per_page = ApplicationController.get_view_settings.users_per_page
  end
  
  def self.news_per_page_admin_panel
  	@@news_per_page = ApplicationController.get_view_settings.news_per_page
  end

  def home
    @@current_page = "/main"
  	@title = "Strona Główna"
    @news = News.all
  	respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @news }
    end
  end

  def about
    @@current_page = "/about"
  	@title = "O nas"
  end

  def archive
    @@current_page = "/archive"
  	@title = "Archiwum"
  end

  def filter_archive
    @@current_page = "/archive"
    if params[:month] == "All year"
      @news = News.find(:all,
        :conditions => ["posted < ? AND posted >= ?",
          DateTime.new.change(:year => params[:year].to_i + 1),
          DateTime.new.change(:year => params[:year].to_i)] )
    else
      @news = News.find(:all,
        :conditions => ["posted < ? AND posted >= ?",
          DateTime.new.change(:year => params[:year].to_i, :month => params[:month].to_i + 1),
          DateTime.new.change(:year => params[:year].to_i, :month => params[:month].to_i)] )
    end
    render 'archive'
  end

  def postulates
    @@current_page = "/postulates"
  	@postulates = Postulate.all
  	respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @postulates }
    end
  end

  def contact
    @@current_page = "/contact"
  	@title = "Kontakt"
  end

  def send_email
    email = @@contact_email
    subject = "test"
    user = "markkkk"
    #UserMailer.xxx
    #UserMailer.contact_email(user, email, subject).deliver
    #puts UserMailer.methods
    #UserMailer.welcome_email(user).deliver
    puts UserMailer.method_defined?("welcome_email")

    redirect_to :back
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
