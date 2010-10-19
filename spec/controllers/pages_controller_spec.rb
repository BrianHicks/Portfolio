require 'spec_helper'

describe PagesController do

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    it "should have a title of home"
  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
    it "should have a title of about"
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
    it "should have a title of contact"
  end

  describe "GET 'philosophy'" do
    it "should be successful" do
      get 'philosophy'
      response.should be_success
    end
    it "should have a title of philosophy"
  end

end
