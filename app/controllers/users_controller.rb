# encoding: utf-8
class UsersController < ApplicationController
  
  layout :layout_sort

  @@per_page = 2

  def self.per_page
    @@per_page
  end
  
  # GET /users
  # GET /users.xml
  def index
  	if(is_admin_logged)
	    @users = User.all
	
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

end
