# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
WPPl::Application.initialize!

Encoding.default_external = Encoding::UTF_8

#ActionMailer config

#ActionMailer::Base.delivery_method = :sendmail
#ActionMailer::Base.sendmail_settings = { :location => '/usr/sbin/sendmail', :arguments => '-i -t' }
#ActionMailer::Base.perform_deliveries = true
#ActionMailer::Base.raise_delivery_errors = true
#ActionMailer::Base.default_charset = "iso-8859-1"

#ActionMailer::Base.delivery_method = :smtp
#ActionMailer::Base.smtp_settings = {
#  :enable_starttls_auto => true,
#  :address => "smtp.gmail.com",   #"localhost",
#  :port => 587,
#  :domain => "domain.com",
#  :user_name => "kulessa.marek@gmail.com", #gmail address
#  :password => "password",  #gmail password
#  :authentication => :plain
#}

#ActionMailer::Base.perform_deliveries = true
#ActionMailer::Base.raise_delivery_errors = true
#
#ActionMailer::Base.delivery_method = :sendmail
#ActionMailer::Base.sendmail_settings = { :location => '/usr/sbin/sendmail', :arguments => '-i -t' }
#ActionMailer::Base.perform_deliveries = true
#ActionMailer::Base.raise_delivery_errors = true
#ActionMailer::Base.default_charset = "iso-8859-1"