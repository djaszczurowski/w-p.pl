class PagesController < ApplicationController
  def home
  	@title = "Home";
  end

  def about
  end

  def archive
  	@title = "Archiwum"
  end

  def postulates
  	@title = "Postulaty"
  end

  def contact
  	@title = "Kontakt"
  end
	
  def admin
  	@admin_panel = true
  	@title = "Panel administracyjny"
  end

end
