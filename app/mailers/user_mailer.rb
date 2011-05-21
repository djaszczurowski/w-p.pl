class UserMailer < ActionMailer::Base
  default :from => "damian.jaszczurowski@gmail.com"
  
  def user_ban_mail_information(user)  	
  	@user = user
  	mail(:to => user.email, :subject => "Zbanowanie konta")
  end
	
 def contact_email(user, email, subject, content) 
 	@user = user
 	@content = content	    
    recipients PagesController.contact_email.to_s
    from email.to_s
    subject subject.to_s
    sent_on Time.now
    body( {:user => user.to_s, :content => content.to_s })
  end

end
