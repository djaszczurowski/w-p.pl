ActionMailer::Base.smtp_settings = {
	:address => "smtp.gmail.com",
	:port => 587,
	:domain => "w-p.pl",
	:user_name => "damian.jaszczurowski",
	:password => "",
	:authentication => "plain",
	:enable_starttls_auto => true
}
