class FeedController < ApplicationController
  layout false

  def index
    @portfolio_items = PortfolioItem.all[0, 10]
    @title = "Brian Hicks | Portfolio"
    @updated = @portfolio_items.first.created_at unless @portfolio_items.empty?

    respond_to do |format|
      format.atom
    end
  end

end
