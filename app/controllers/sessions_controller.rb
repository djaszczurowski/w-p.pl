class SessionsController < ApplicationController
	helper_method :sign_in
  def new
  end
    
  def destroy  
	session[:current_user_id] = nil
	session[:log_as_admin] = false;
	redirect_to root_url, :notice => "Wylogowano!"
  end
	
  def create  	
		user = User.authenticate(params[:session][:username],params[:session][:password])
		if user				
			if(session[:log_as_admin])
				if user.privilegesLevel > 0
					sign_in(user)	
					redirect_to news_managment_url
				else					
					redirect_to admin_url, :notice => "Podano login zwyklego uzytkownika"
				end
			else
				sign_in(user)					
				redirect_to root_url, :notice => 'Zalogowany'
			end
		else
			flash.now[:error] = "Niepoprawne haslo lub login"			
			render "new"
		end
  end
  
  def sign_in(user)
	  #cookies.permanent.signed[:remember_token] = [user.id, user.passSalt]
	  #@current_user = user
	  
	  session[:current_user_id] = user.id
	  @current_user = user
	  #cookies[:remember_token] = { :value => user.id,
	  #							:expires => 2.minutes.from_now}	  
  	end  
  
  	def user_from_remember_token
  		User.authenticate_with_salt(*remember_token)
  	end
  
  	def remember_token
  		cookies.signed[:remember_token] || [nil, nil]
  	end
end

