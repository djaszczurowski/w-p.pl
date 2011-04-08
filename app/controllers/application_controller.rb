class ApplicationController < ActionController::Base
  protect_from_forgery
  
  layout "application"
  helper_method :admin_panel
  helper_method :current_user
  helper_method :is_admin_logged
  helper_method :is_english_language
  
  def is_admin_logged
  	if session[:current_user_id]
  		user = User.find(session[:current_user_id])
  		return	user && user.privilegesLevel > 0
  	else
  		false
  	end
  end
  
  def admin_panel  	
  	return @admin_panel
  end
  
  def is_english_language
  	#na podstawie ciasteczka ? 
  	return @is_english_lang
  end
  
  def current_user  	  
  	@current_user ||= session[:current_user_id] if session[:current_user_id]  		
  	return @current_user
  end
 
  
end
