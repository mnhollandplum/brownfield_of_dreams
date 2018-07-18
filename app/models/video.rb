class Video
  attr_reader :title,
              :description,
              :thumbnail

  def initialize(attrs)
    @title = attrs[:snippet][:title]
    @description = attrs[:snippet][:description]
    @thumbnail = attrs[:snippet][:thumbnails][:high][:url]
  end
end
