# TODO - this is required for an extension task


# module YouTube
#
#   class Video
#     attr_reader :thumbnail
#
#     def initialize(data = {})
#       @thumbnail = data[:items].first[:snippet][:thumbnails][:high][:url]
#     end
#
#     def self.by_id(id)
#       new(YoutubeService.new.video_info(id))
#     end
#   end
#
# end
