require 'spec_helper'

describe PagesController do
  render_views
  
  before :each do
    @base_title = "Brian Hicks | "
  end
  
  describe "GET 'home'" do
    before :each do
      get 'home'
    end
    it "should be successful" do
      response.should be_success
    end
    it "should have a title of home" do
      response.should have_selector("title", :content => "#{@base_title}Home")
    end
    it { assigns[:items].should == PortfolioItem.all }
  end

  describe "GET 'about'" do
    before :each do
      get 'about'
    end
    it "should be successful" do
      response.should be_success
    end
    it "should have a title of about" do
      response.should have_selector("title", :content => "#{@base_title}About")
    end
  end

  describe "GET 'contact'" do
    before :each do
      get 'contact'
    end
    it "should be successful" do
      response.should be_success
    end
    it "should have a title of contact" do
      response.should have_selector("title", :content => "#{@base_title}Contact")
    end
  end

  describe "GET 'philosophy'" do
    before :each do
      get 'philosophy'
    end
    it "should be successful" do
      response.should be_success
    end
    it "should have a title of philosophy" do
      response.should have_selector("title", :content => "#{@base_title}Philosophy")
    end
  end

end
