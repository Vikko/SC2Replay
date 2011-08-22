require 'spec_helper'

describe Player do
  it{ should have(1).errors_on(:name) }
  it{ should have(1).errors_on(:race) }
  it{ should have(1).errors_on(:team) }
  
  context "After object creation" do
    subject { Fabricate(:player) }
   
    it {should be_valid}
  end
end

