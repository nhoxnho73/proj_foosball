FactoryGirl.define do
  factory :team do
    name "teamName"
    trait :with_users do
      players { build_list :user, 2 }
    end
  end
end