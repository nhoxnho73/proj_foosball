FactoryGirl.define do
  factory :team do
    name "teamName"
    trait :with_players do
      players { build_list :player, 2 }
    end
  end
end