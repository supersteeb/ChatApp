class Friendship < ApplicationRecord
  belongs_to :user, :class_name => "User"
  belongs_to :friend, :class_name => "User"
#  has_many :friends   I think the user has_many :friends, through: :friendships takes care of this
end
