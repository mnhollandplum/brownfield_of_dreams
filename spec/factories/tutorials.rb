FactoryBot.define do
  factory :tutorial do
    title Faker::Pokemon.move
    description Faker::SiliconValley.quote
    thumbnail 'picture.jpeg'
    playlist_id Faker::Crypto.md5
    classroom false
  end
end
