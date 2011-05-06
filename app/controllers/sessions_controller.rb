# encoding:utf-8
class SessionsController < ApplicationController
	helper_method :sign_in
	helper_method :sign_user_out
  def new
  end
    
  def destroy  
    session[:current_user_id] = nil
    session[:log_as_admin] = false;
    redirect_to root_url, :notice => get_logged_out_text
  end
  
  
   

  def create  	
		user = User.authenticate(params[:session][:username],params[:session][:password])
		if user		
			if(is_user_banned(user))				
				if(user.banned < Date.current())
					user.banned = nil
					user.save
					if(session[:log_as_admin])
						if user.privilegesLevel > 0
							sign_in(user)	
							redirect_to news_managment_url
						else					
							redirect_to admin_url, :notice => get_faulty_login_text
						end
					else
						sign_in(user)					
						redirect_to :back, :notice => get_logged_in_text
					end
				else					
					redirect_to root_url, :notice => get_ban_text + user.banned.to_s
				end	
			else							
				if(session[:log_as_admin])
					if user.privilegesLevel > 0
						sign_in(user)	
						redirect_to news_managment_url
					else					
						redirect_to admin_url, :notice => get_faulty_login_text
					end
				else
					sign_in(user)					
					redirect_to :back, :notice => get_logged_in_text
				end
			end
		else     	
			redirect_to :back, :notice => get_faulty_login_text
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
  	
  	def get_ban_text	
  		if is_english_language
  			"Your account will be unblocked on"
  		else
  			"Twoje konto zostanie odblokowane za  "
  		end
  	end
  	
  	def get_faulty_login_text
  		if is_english_language
  			"Given password or login is not valid"
  		else
  			"Podane hasło lub login jest niepoprawne"
  		end
  	end
  	
  	def get_logged_in_text
  		if is_english_language
  			"Logged in"
  		else
  			"Zalogowano"
  		end
  	end
  	
  	def get_logged_out_text
  		if is_english_language
  			"Logged out"
  		else
  			"Wylogowano"
  		end
  	end
  	
end

