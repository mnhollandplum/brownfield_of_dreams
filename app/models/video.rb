class Video < ApplicationRecord
  has_many :users, through: :user_videos
  has_many :user_videos
  belongs_to :tutorial
end
