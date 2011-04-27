class ContactSettingsController < ApplicationController
  # GET /contact_settings
  # GET /contact_settings.xml
  layout "admin_panel"
  def index
    @contact_settings = ContactSetting.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contact_settings }
    end
  end

  # GET /contact_settings/1
  # GET /contact_settings/1.xml
  def show
    @contact_setting = ContactSetting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contact_setting }
    end
  end

  # GET /contact_settings/new
  # GET /contact_settings/new.xml
  def new
    @contact_setting = ContactSetting.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contact_setting }
    end
  end

  # GET /contact_settings/1/edit
  def edit
    @contact_setting = ContactSetting.first
  end

  # POST /contact_settings
  # POST /contact_settings.xml
  def create
    @contact_setting = ContactSetting.new(params[:contact_setting])

    respond_to do |format|
      if @contact_setting.save
        format.html { redirect_to(@contact_setting, :notice => 'Contact setting was successfully created.') }
        format.xml  { render :xml => @contact_setting, :status => :created, :location => @contact_setting }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contact_setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contact_settings/1
  # PUT /contact_settings/1.xml
  def update
    @contact_setting = ContactSetting.find(params[:id])

    respond_to do |format|
      if @contact_setting.update_attributes(params[:contact_setting])
        format.html { redirect_to(@contact_setting, :notice => 'Contact setting was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contact_setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_settings/1
  # DELETE /contact_settings/1.xml
  def destroy
    @contact_setting = ContactSetting.find(params[:id])
    @contact_setting.destroy

    respond_to do |format|
      format.html { redirect_to(contact_settings_url) }
      format.xml  { head :ok }
    end
  end
end
