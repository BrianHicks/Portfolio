require 'spec_helper'

describe PagesController do
  render_views
  
  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    it "should have a title of home" do
      response.should have_selector("title", :content => "home")
    end
  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
    it "should have a title of about" do
      response.should have_selector("title", :content => "about")
    end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
    it "should have a title of contact" do
      response.should have_selector("title", :content => "contact")
    end
  end

  describe "GET 'philosophy'" do
    it "should be successful" do
      get 'philosophy'
      response.should be_success
    end
    it "should have a title of philosophy" do
      response.should have_selector("title", :content => "philosophy")
    end
  end

end
