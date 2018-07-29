class Tutorial < ApplicationRecord
  has_many :videos
  acts_as_taggable_on :tags, :tag_list
end
