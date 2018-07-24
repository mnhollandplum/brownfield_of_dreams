namespace :import do
  desc:"All youtube data"
  task all: [:tutorials, :videos]

  desc:"Create Tutorials"
  task :tutorials, [:tutorials] => :environment do
    response = Faraday.get("https://www.googleapis.com/youtube/v3/playlists?key=#{ENV['YOUTUBE_API_KEY']}&part=snippet&channelId=UCwWA2R0g0x3UdEFSIKSDOmw")
    data = JSON.parse(response.body, symbolize_names: true)
    data[:items].each do |tutorial|
      Tutorial.create(
        title:       tutorial[:snippet][:title],
        description: tutorial[:snippet][:description],
        thumbnail:   tutorial[:snippet][:thumbnails][:high][:url],
        playlist_id: tutorial[:id])
      end
    end

    desc:"Create Videos"
    task :videos, [:videos] => :environment do
      tutorials = Tutorial.all
      tutorials.each do |tutorial|
        response = Faraday.get("https://www.googleapis.com/youtube/v3/playlistItems?key=#{ENV['YOUTUBE_API_KEY']}&playlistId=#{tutorial.playlist_id}&part=snippet&maxResults=50&order=date")
        data = JSON.parse(response.body, symbolize_names: true)
          data[:items].each do |vid|
          tutorial.videos.create!(
            title:       vid[:snippet][:title],
            description: vid[:snippet][:description],
            thumbnail:   vid[:snippet][:thumbnails][:high][:url],
            video_id:    vid[:snippet][:resourceId][:videoId])
          end
        end
      end
    end
