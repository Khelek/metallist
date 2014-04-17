FactoryGirl.define do
  factory :notification do
    title
    body { generate :string }
  end
end
