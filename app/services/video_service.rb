class VideoService
  def playlist
    data[:items].map do |video|
      Video.new(video)
    end
  end

  private

    def response
      Faraday.get("https://www.googleapis.com/youtube/v3/playlistItems?key=#{ENV['YOUTUBE_API_KEY']}&part=snippet&playlistId=UUwWA2R0g0x3UdEFSIKSDOmw")
    end

    def data
      JSON.parse(response.body, symbolize_names: true)
    end
end
