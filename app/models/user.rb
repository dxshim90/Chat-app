class User < ApplicationRecord
  has_many :messages
  has_many :groups, through: :messages

  validates :username, presence: true
  validates :password, presence: true
end
