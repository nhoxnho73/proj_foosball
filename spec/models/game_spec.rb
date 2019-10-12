require 'rails_helper'

RSpec.describe Game, type: :model do
  describe "test relationship" do
    it { should belong_to(:match) }
    it { should belong_to(:winner) }
    it { should belong_to(:loser) }
  end

  describe "validation attribute" do
    it { should validate_numericality_of(:score) }
    it { should_not allow_value(-1).for(:score) }
    it { should_not allow_value(11).for(:score) }
    it { should allow_value(10).for(:score) }
  end
end