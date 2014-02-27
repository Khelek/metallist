FactoryGirl.define do

  factory :news do
    title
    body
    published_at {generate :date}
    photo {generate :image}
  end

end
