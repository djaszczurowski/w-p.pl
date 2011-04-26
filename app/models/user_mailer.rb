class UserMailer < ActionMailer::Base

  def self.contact_email(user, email, subject)
    puts "sending.............................."
    recipients "mark1989@o2.com"
    from "My Awesome Site Notifications <notifications@example.com>"
    subject "Welcome to My Awesome Site"
    sent_on Time.now
    body( {:user => "user", :url => "http://example.com/login"})
  end

  def self.xxx
    puts "???????????????????????????????????????"
  end

  def self.welcome_email(user)
    recipients "kulessa.marek@gmail.com"
    from "My Awesome Site Notifications <notifications@example.com>"
    subject "Welcome to My Awesome Site"
    sent_on Time.now
    body( {:user => user, :url => "http://example.com/login"})
  end

end