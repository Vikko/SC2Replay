require 'spec_helper'

describe Replay do
  it{ should have(1).errors_on(:title) }
  it{ should have(1).errors_on(:map_id) }
  it{ should have(1).errors_on(:game_type) }
  
  context "After object creation" do
    subject { Fabricate(:replay) }
    
    it {should be_valid}
  end
end

