require 'spec_helper'

describe Asset do
  it { should belong_to(:portolio_item) }
end
