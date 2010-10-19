require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the PagesHelper. For example:
#
# describe PagesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe PagesHelper do
  describe 'title' do
    it 'creates a title based on input' do
      helper.title("home").should == "Brian Hicks | home"
    end
    it 'defaults a title when no input is provided' do
      helper.title().should == "Brian Hicks"
    end
  end
end
