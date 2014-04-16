FactoryGirl.define do
  factory :item do
    title
    price { generate :integer }
  end
end
