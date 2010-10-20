require 'spec_helper'

describe User do
  before :each do
    @user = Factory(:user)
  end  
  
  describe "short_name" do
    it "should return first name and last name" do
      @user.short_name.should eql(@user.first_name + " " + @user.last_name)
    end
  end
  
  describe "full_name" do
    it "should return all three names for full_name" do
      @user.full_name.should eql(@user.first_name + " " + @user.middle_name + " " + @user.last_name)
    end
  end
end
