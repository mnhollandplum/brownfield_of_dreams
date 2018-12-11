class Github < ApplicationRecord
  validates_presence_of :u_id
  validates_presence_of :username
  validates_presence_of :token

  belongs_to :user
end
