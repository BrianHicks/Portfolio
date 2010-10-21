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

end
