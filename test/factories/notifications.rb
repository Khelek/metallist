FactoryGirl.define do
  factory :notification do
    title
    body { generate :string }
    for_all_users false
  end
end
