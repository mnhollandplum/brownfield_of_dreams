FactoryBot.define do
  factory :video do
    title Faker::Pokemon.name
    description Faker::SiliconValley.motto
    thumbnail 'picture.jpeg'
    video_id Faker::Crypto.md5
    tutorial
  end
end
