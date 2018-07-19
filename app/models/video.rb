class Video
  attr_reader :title,
              :description,
              :thumbnail,
              :video_id

  def initialize(attrs)
    @title = attrs[:snippet][:title]
    @description = attrs[:snippet][:description]
    @thumbnail = attrs[:snippet][:thumbnails][:high][:url]
    @video_id = attrs[:snippet][:resourceId][:videoId]
  end
end
