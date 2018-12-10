
class Friendship < ApplicationRecord

  belongs_to :user
  belongs_to :friend, class_name: "User"
  # is friend going to be an issue if using friend_id in the model ???



end
