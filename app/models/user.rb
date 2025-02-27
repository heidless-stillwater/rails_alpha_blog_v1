
class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :articles, dependent: :destroy

  validates :username,
              presence: true,
              uniqueness: { case_insensitive: true },
              length: { minimum: 3, maximum: 25 }

  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email,
              format: { with: VALID_EMAIL_REGEX },
              presence: true,
              uniqueness: { case_insensitive: true },
              length: { maximum: 105 }

  has_secure_password
end
