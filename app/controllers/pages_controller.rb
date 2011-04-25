# encoding: utf-8
class PagesController < ApplicationController
 
	#before_filter :authenticate_admin, :only => :admin
  helper_method :admin_panel

  @@pl_titles = ["Strona Główna", "O nas", "Archiwum", "Postulaty", "Kontakt"]
  @@eng_titles = ["Main", "About", "Archive", "Postulates", "Contact"]
  @@page_links = ["/home", "/about", "/archive", "/postulates", "/contact"]
  @@date_length = 18
  @@news_length = 40
  @@news_on_main = 4
  @@contact_email = "kulessa.marek@gmail.com"
  @@current_page = "/main"

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
    UserMailer.welcome_email(user).deliver

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
