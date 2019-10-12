require 'rails_helper'

RSpec.describe Team, type: :model do
  describe "test relationship" do
    it { should have_and_belong_to_many(:matches) }
    it { should have_many(:players) }
    it { should have_many(:winning_games) }
    it { should have_many(:losing_games) }
    it { should have_many(:winning_matches) }
  end

  describe "validation attribute" do
    it { should validate_presence_of(:name) }
  end
end
