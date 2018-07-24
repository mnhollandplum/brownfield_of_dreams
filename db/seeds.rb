# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'admin@email.com', first_name: 'admin', last_name: 'adminington', password:  ENV['ADMIN_PASSWORD'], role: 1)
# 
#
#
#
# response = Faraday.get("https://www.googleapis.com/youtube/v3/search?key=#{ENV['YOUTUBE_API_KEY']}&channelId=UCwWA2R0g0x3UdEFSIKSDOmw&part=snippet&maxResults=50&order=date")
#
# data = JSON.parse(response.body, symbolize_names: true)
#
# data[:items].each do |vid|
#   Video.create(
#     title:       vid[:snippet][:title],
#     description: vid[:snippet][:description],
#     thumbnail:   vid[:snippet][:thumbnails][:high][:url],
#     video_id:    vid[:id][:videoId])
# end
