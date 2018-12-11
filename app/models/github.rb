class Github < ApplicationRecord
  validates :u_id, presence: true, uniqueness: true
  validates_presence_of :username
  validates_presence_of :token

  belongs_to :user
end
