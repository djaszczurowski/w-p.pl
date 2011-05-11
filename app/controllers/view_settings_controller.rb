class ViewSettingsController < ApplicationController
  # GET /view_settings
  # GET /view_settings.xml
  layout "admin_panel"
  
  before_filter :authorize
  
  def index
    @view_settings = ViewSetting.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @view_settings }
    end
  end

  # GET /view_settings/1
  # GET /view_settings/1.xml
  def show
    @view_setting = ViewSetting.first

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @view_setting }
    end
  end

  # GET /view_settings/new
  # GET /view_settings/new.xml
  def new
    @view_setting = ViewSetting.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @view_setting }
    end
  end

  # GET /view_settings/1/edit
  def edit
    @view_setting = ViewSetting.first
    w = @view_setting.news_on_main
    @view_setting.news_on_main = w
  end

  # POST /view_settings
  # POST /view_settings.xml
  def create
    @view_setting = ViewSetting.new(params[:view_setting])

    respond_to do |format|
      if @view_setting.save
        format.html { redirect_to(@view_setting, :notice => 'View setting was successfully created.') }
        format.xml  { render :xml => @view_setting, :status => :created, :location => @view_setting }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @view_setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /view_settings/1
  # PUT /view_settings/1.xml
  def update
    @view_setting = ViewSetting.find(params[:id])

    respond_to do |format|
      if @view_setting.update_attributes(params[:view_setting])
        format.html { redirect_to viewsettings_path }#redirect_to(@view_setting, :notice => 'View setting was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @view_setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /view_settings/1
  # DELETE /view_settings/1.xml
  def destroy
    @view_setting = ViewSetting.find(params[:id])
    @view_setting.destroy

    respond_to do |format|
      format.html { redirect_to(view_settings_url) }
      format.xml  { head :ok }
    end
  end
  
 
end
