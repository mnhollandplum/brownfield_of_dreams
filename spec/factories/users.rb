FactoryBot.define do
  factory :user do
    email      { Faker::Internet.email }
    first_name { Faker::Dog.name }
    last_name  { Faker::Artist.name }
    password   { Faker::Color.color_name }
    role       { :default }
    activated  { :pending }
  end

  factory :admin, parent: :user do
    role { :admin }
    activated  { :active }
  end

  factory :active_user, parent: :user do
    activated  { :active }
  end
end
