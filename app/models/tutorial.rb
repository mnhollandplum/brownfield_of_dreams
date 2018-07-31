class Tutorial < ApplicationRecord
  has_many :videos
  acts_as_taggable_on :tags, :tag_list

  def self.search(search)
    where("title LIKE ?", "%#{search}%")
  end
end
