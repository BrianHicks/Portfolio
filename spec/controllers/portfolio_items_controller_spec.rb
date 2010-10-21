require 'spec_helper'

describe PortfolioItemsController do
  render_views
  
  before :each do
    @user = Factory.create(:user)
    @pi = Factory.create(:portfolio_item, :user_id => @user.id)
    @invalid = Factory.stub(:portfolio_item, :id => @pi.id)
  end
  describe "index action" do
    it "for a logged in user should render index template" do
      sign_in @user
      get :index
      response.should render_template(:index)
    end
    it "for a anonymous user should render index template" do
      get :index
      response.should render_template(:index)
    end
  end
  
  describe "show action" do
    it "for a logged in user should render show template" do
      sign_in @user
      get :show, :id => @pi
      response.should render_template(:show)
    end
    it "for an anonymous user should render show template" do
      get :show, :id => @pi
      response.should render_template(:show)
    end
  end
  
  describe "new action" do
    it "for a logged in user should render new template" do
      sign_in @user
      get :new
      response.should render_template(:new)
    end
    it "for an anonymous user should redirect to login page" do
      get :new
      response.should redirect_to(new_user_session_path)
    end
  end
  
  describe "create action" do
    it "for a logged in user should redirect when model is valid" do
      sign_in @user
      post :create
      response.should redirect_to(portfolio_item_url(assigns[:portfolio_item]))
    end
    it "for a logged in user should redirect to the sign in page" do
      post :create
      response.should redirect_to(new_user_session_path)
    end
  end
  
  describe "edit action" do
    it "for a logged in user should render edit template" do
      sign_in @user
      get :edit, :id => @pi
      response.should render_template(:edit)
    end
    it "for an anonymous user should redirect to sign in page" do
      get :edit, :id => @pi
      response.should redirect_to(new_user_session_path)
    end
  end

  describe "update action" do
    it "for a logged in user should redirect when model is valid" do
      sign_in @user
      put :update, :id => @pi
      response.should redirect_to(portfolio_item_url(assigns[:portfolio_item]))
    end
    it "for a anonymous user should redirect to sign in page" do
      put :update, :id => @pi
      response.should redirect_to(new_user_session_path)
    end
  end
  
  describe "destroy action" do
    it "for a logged in user should destroy model and redirect to index action" do
      sign_in @user
      delete :destroy, :id => @pi
      response.should redirect_to(portfolio_items_url)
      PortfolioItem.exists?(@pi.id).should be_false
    end
    it "for an anonymous user should destroy model and redirect to index action" do
      delete :destroy, :id => @pi
      response.should redirect_to(new_user_session_path)
      PortfolioItem.exists?(@pi.id).should be_true
    end
  end
end
