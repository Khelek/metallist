# coding: utf-8

FactoryGirl.define do
  factory :user do
    password  "ashQDR123!@#"
    email { generate :email }
    first_name "asht"
    last_name "asht"

    after(:create) do |user|
      user.activate
    end
  end

  factory :admin, parent: :user do
    admin true
 end
end
