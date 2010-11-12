class PortfolioItemsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  
  def index
    if params[:category]
      @portfolio_items = PortfolioItem.where("category = ?", params[:category]).all
    else
      @portfolio_items = PortfolioItem.all
    end
  end
  
  def show
    @portfolio_item = PortfolioItem.find(params[:id])
  end
  
  def new
    @portfolio_item = PortfolioItem.new
    5.times { @portfolio_item.assets.build }
  end
  
  def create
    @portfolio_item = PortfolioItem.new(params[:portfolio_item])
    if @portfolio_item.save
      flash[:notice] = "Portfolio item created. As soon as files are uploaded Portfolio item will be made live."
      redirect_to @portfolio_item
    else
      render :action => 'new'
    end
  end
  
  def edit
    @portfolio_item = PortfolioItem.find(params[:id])
    5.times { @portfolio_item.assets.build }
  end
  
  def update
    @portfolio_item = PortfolioItem.find(params[:id])
    if @portfolio_item.update_attributes(params[:portfolio_item])
      flash[:notice] = "Successfully updated portfolio item."
      redirect_to @portfolio_item
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @portfolio_item = PortfolioItem.find(params[:id])
    @portfolio_item.destroy
    flash[:notice] = "Successfully destroyed portfolio item."
    redirect_to portfolio_items_url
  end
end
