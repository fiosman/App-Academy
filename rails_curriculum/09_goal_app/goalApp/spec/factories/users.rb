FactoryBot.define do   
  factory :user do   
    username { Faker::Internet.username }
    password { Faker::Internet.password(min_length: 6) }
  end
end