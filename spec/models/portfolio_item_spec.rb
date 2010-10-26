require File.dirname(__FILE__) + '/../spec_helper'

describe PortfolioItem do
  it { should belong_to(:user) }
  it { should have_many(:assets) }

  it "should be valid" do
    PortfolioItem.new.should be_valid
  end
end
