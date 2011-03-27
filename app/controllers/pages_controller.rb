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

end
