# encoding: utf-8
class User < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 2
	attr_accessor :password
	before_save :encrypt_password
	
	validates_confirmation_of :password
	validates_presence_of :password, :on => :create
	validates_presence_of :username, :on => :create
	validates_presence_of :email, :on => :create
	validates_uniqueness_of :email
	validates_uniqueness_of :username
	
	set_primary_key :user_id
	has_many :news
	has_many :comments
	has_many :postulates

  
	def self.authenticate(username, password)
		if(username && password)
			user = find_by_username(username)		
			if user		
				if user.passHash == BCrypt::Engine.hash_secret(password, user.passSalt)
					return user
				else
					return nil
				end
			else
				return nil
			end
		else
			nil
		end
	end	
	
	def encrypt_password
		if password.present?
			self.passSalt = BCrypt::Engine.generate_salt
			self.passHash = BCrypt::Engine.hash_secret(password, passSalt)
		end
	end
	
	def authenticate_with_salt(id, salt)
		user = find_by_id(id)
		(user && user.passSalt == salt) ? user : nil
  end

end
