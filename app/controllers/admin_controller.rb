class AdminController < ApplicationController
  layout "admin_panel"
  
  def new
  	
  end
  
  def news_managment  
  	puts "news" 
		@admin_panel = true
  		@title = "Zarzadzanie newsami"
	end

  def users_managment
  	
  end

  def postulates_managment
  
  end

  def admin_log   	
  	
  	if(session[:current_user_id] && User.find(session[:current_user_id]).privilegesLevel > 0)  		
  		@admin_panel = true
  		redirect_to admin_url
  	else  		
  		@admin_panel = true
  		@title = "Zaloguj jako administrator"
  	end
  end
  
  def admin_panel  	
  	@admin_panel = true
  	@title = "Panel Administracyjny"
  end
  
  def create  	
  		if(params[:session][:username] && params[:session][:password])
	  		user = User.authenticate(params[:admin][:username],params[:admin][:password])
			if user	&& user.privilegesLevel >0 		
				sign_in(user)	
				@admin_panel = true				
				redirect_to admin_url, :notice => 'Zalogowany jako administrator'
			else
				puts "nie udalo sie"
				flash.now[:error] = "Niepoprawne haslo lub login"			
				redirect_to admin
			end
			else
				puts "nie udalo sie"
				flash.now[:error] = "Niepoprawne haslo lub login"			
				redirect_to admin
			end
  	end
	
   def sign_in(user)   
	  session[:current_user_id] = user.id
	  @current_user = user		
   end
   
   
end
