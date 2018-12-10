FactoryBot.define do
  factory :github do
    user nil
    sequence(:token)    { |n|  "faketoken#{n}" }
    sequence(:u_id)     { |n|  "#{n*100}"      }
    sequence(:username) { |n|  "username#{n}"  }
  end
end
