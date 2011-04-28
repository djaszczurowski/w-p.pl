# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  layout "application"
  
  helper_method :admin_panel
  helper_method :current_user
  helper_method :is_admin_logged
  helper_method :is_english_language
  helper_method :change_language
  helper_method :authorize
  helper_method :get_view_settings 
  
 
  
 def authorize
 	if is_admin_logged
 		true
 	else
 		redirect_to admin_path
 		false
 	end
 end
 
 def self.get_view_settings
  	ViewSetting.first
  end
  
  def self.get_contact_settings
  	ContactSetting.first
  end
	
  def is_admin_logged
  	if session[:current_user_id]
  		user = User.find(session[:current_user_id])
  		return	user && user.privilegesLevel > 0
  	else
  		false
  	end
  end
  
  def change_language
    if is_english_language
      cookies[:lang] = "pl"
    else
      cookies[:lang] = "en"
    end
    redirect_to :back
  end
  
  def admin_panel  	
  	return @admin_panel
  end
  
  def is_english_language
  	return cookies[:lang] == "en"
  end
  
  def current_user  	  
  	@current_user ||= session[:current_user_id] if session[:current_user_id]  		
  	return @current_user
  end
 
  
end
