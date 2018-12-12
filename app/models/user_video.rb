class UserVideo < ApplicationRecord
  belongs_to :video, foreign_key: "video_id"
  belongs_to :user, foreign_key: "user_id"

  def bookmarked_videos
    User.where(user_id: current_user.id)
    binding.pry
      .joins(:video)
      .order('videos.tutorial_id asc', 'videos.position asc')
  end
end
