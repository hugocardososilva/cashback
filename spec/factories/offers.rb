FactoryBot.define do
  factory :offer do
    advertiser_name { Faker::Company.name }
    url { Faker::Internet.url }
    description { Faker::Lorem.sentence}
    starts_at { DateTime.now }
    ends_at { DateTime.tomorrow }
    premium {false}
  end
end