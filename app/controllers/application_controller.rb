class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :admin_panel
  
  def admin_panel
  	return @admin_panel
  end
  
end
