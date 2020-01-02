FactoryBot.define do   
  factory :goal do   
    title { Faker::Lorem.word }
    details { Faker::Lorem.sentence }
    user_id { nil }
  end
end