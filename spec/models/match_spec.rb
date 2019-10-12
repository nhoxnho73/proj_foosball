require 'rails_helper'

RSpec.describe Match, type: :model do
  describe "test relationship" do
    it { should have_many(:games) }
    it { should belong_to(:winner) }
    it { should have_and_belong_to_many(:teams) }
  end
end