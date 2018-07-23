class VideoService
  def playlist
    data[:items].map do |video|
      Video.create(title: video[:snippet])
    end
  end

  private
    def response
      Faraday.get("https://www.googleapis.com/youtube/v3/search?key=#{ENV['YOUTUBE_API_KEY']}&channelId=UCwWA2R0g0x3UdEFSIKSDOmw&part=snippet&maxResults=50&order=date")
    end

    def data
      JSON.parse(response.body, symbolize_names: true)
    end
end
