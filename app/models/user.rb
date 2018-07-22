class User < ApplicationRecord
  enum role: [:default, :admin]
  has_secure_password
end
