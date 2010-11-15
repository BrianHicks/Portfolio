class PagesController < ApplicationController
  def home
    @title = "Home"
    @items = PortfolioItem.all
  end

  def about
    @title = "About"
  end

  def contact
    @title = "Contact"
  end

  def philosophy
    @title = "Philosophy"
  end
  
  def read #philosophy/read
    render :layout => false
  end
end
