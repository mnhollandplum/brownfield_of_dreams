class Tutorial < ApplicationRecord
  has_many :videos
  acts_as_taggable
end
