class PagesController < ApplicationController
  # set up some static pages under routing
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

  def read #philosophy/read - Sencha app doesn't use layout
    render :layout => false
  end
end
