class User < ActiveRecord::Base
	
	set_primary_key :user_id
	
	#acts_as_authentic 
	
	#has_many :news, :postulates, :commentaries
	
	#before_save :encrypt_password
	
	#private 
	#def encrypt_password
	#	self.password_hash = encrypt(password_hash)
	#end
	#def encrypt(string)
	#	Digest::SHA2.hexdigest(string)
	#end
end
