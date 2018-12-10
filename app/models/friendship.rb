
class Friendship < ApplicationRecord

  belongs_to :user
  belongs_to :friend, class_name: "User" #maybe single ''

  validates_uniqueness_of :friend, :scope => [:user]
  # validates_uniqueness_of :user, :scope => [:friend]



end
