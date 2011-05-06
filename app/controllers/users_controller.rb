# encoding: utf-8
class UsersController < ApplicationController

  before_filter :authorize, :only => [:index, :destroy]
  layout :get_users_layout
  
  @@per_page = ApplicationController.get_view_settings.users_per_page

  def self.per_page
    @@per_page
  end

  
  # GET /users
  # GET /users.xml
  def index  	
  	 
  	if(is_admin_logged)
  	    if params[:sort_type]
	    	@users = User.all(:order => params[:sort_type].to_s)
	    else
	   		@users = User.all
	   	end
	
	    respond_to do |format|
	      format.html # index.html.erb
	      format.xml  { render :xml => @users }
	    end
	else
		redirect_to root_url
	end
  end

  # GET /users/1
  # GET /users/1.xml
  def show	
  		@user = User.find(params[:id]) 
  		if @user.avatar && @user.avatar  != ""
  			@avatar_path = "http://gravatar.com/avatar/" + Digest::MD5.hexdigest(@user.avatar).to_s
  		else
  			@avatar_path = "/images/UserUnknownIcon.jpg"
  		end
  		
  		puts @user.registered
  		puts @user.banned
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new
	
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new_by_admin
    @user = User.new
	
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
  	if(User.find(session[:current_user_id]).banned)
  		session[:current_user_id] = nil
  		redirect_to root_url
  	else  		
	  	if(is_admin_logged)
	  		@user = User.find(params[:id])
	  	else
		  	if(session[:current_user_id])
		  		if(session[:current_user_id].to_s == params[:id].to_s)
		    		@user = User.find(session[:current_user_id])
		    	else
		    		redirect_to root_url
		    	end
		   else
		   		redirect_to root_url
		   	end	  
		end
	end
  end

	def edit_by_admin
  	if(is_admin_logged)
  		@user = User.find(params[:id])
  		
  	else
	  	if(session[:current_user_id])
	  		if(session[:current_user_id].to_s == params[:id].to_s)
	    		@user = User.find(session[:current_user_id])
	    	else
	    		redirect_to root_url
	    	end
	   else
	   		redirect_to root_url
	   	end	  
	end
  end
  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
	@user.registered = Date.current()
    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :notice => 'Konto utworzone') }
        session[:current_user_id] = @user.id
	  	@current_user = @user
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end

 def get_users_layout
  	if(action_name == "show" || action_name == "new" || action_name == "edit")
  		"application"
  	else if(action_name == "edit_by_admin")
  		"admin_panel"
  	else
  		"admin_panel"
  	end
  	end
  end
  
  def ban_user()  	
  	user = User.find(params[:id])  	
  	if(params[:time].to_s == 7.to_s)  		
  		puts Date.current()
  		user.banned = Date.current() + 7.days
  		puts user.banned
  		user.save
  	else
  		user.banned = Date.current() + 999.years
  		user.save  	
  	end
  	
  	#sign_out(user)
  	#UserMailer.user_ban_mail_information(user).deliver
  	
  	inform_user
  	redirect_to edit_user_by_admin_path(user)
  end
  
  def cancel_user_ban()
  	user = User.find(params[:id])
  	user.banned = nil
  	user.save
  	redirect_to edit_user_by_admin_path(user)
  end
  
  
  
  def inform_user
  	
  end	
end
