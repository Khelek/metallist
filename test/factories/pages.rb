FactoryGirl.define do
  factory :page do
    title
    body
    slug { generate :string }
  end
end
