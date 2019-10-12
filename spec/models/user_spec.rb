require 'rails_helper'

RSpec.describe User, type: :model do
  describe "test relationship" do
    it { should belong_to(:team) }
  end

  describe "validation attribute" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end
end