# encoding: utf-8
class PagesController < ApplicationController
 
	#before_filter :authenticate_admin, :only => :admin
  helper_method :admin_panel
  def home
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
  	@title = "O nas"
  end

  def archive
  	@title = "Archiwum"
  end

  def postulates
  	@postulates = Postulate.all
  	respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @postulates }
    end
  end

  def contact
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
