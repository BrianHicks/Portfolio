require 'spec_helper'

describe PortfolioItemsController do
  render_views
  
  before :each do
    @pi = Factory.create(:portfolio_item)
    @invalid = Factory.stub(:portfolio_item, :id => @pi.id)
  end
  describe "index action" do
    it "for a logged in user should render index template" do
      get :index
      response.should render_template(:index)
    end
    it "for a anonymous user should render index template" do
      get :index
      response.should render_template(:index)
    end
  end
  
  it "show action should render show template" do
    get :show, :id => @pi
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    post :create
    response.should redirect_to(portfolio_item_url(assigns[:portfolio_item]))
  end
  
  it "edit action should render edit template" do
    get :edit, :id => @pi
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    put :update, :id => @pi
    response.should redirect_to(portfolio_item_url(assigns[:portfolio_item]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    delete :destroy, :id => @pi
    response.should redirect_to(portfolio_items_url)
    PortfolioItem.exists?(@pi.id).should be_false
  end
end
