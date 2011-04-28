class UserMailer < ActionMailer::Base
  default :from => "damian.jaszczurowski@gmail.com"
  
  def user_ban_mail_information(user)  	
  	mail(:to => user.email, :subject => "Zbanowanie konta")
  end


end
