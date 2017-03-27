class Appearance < ApplicationRecord
  belongs_to :guest
  belongs_to :episode
  belongs_to :user
  belongs_to :producer, :class_name => :User, :foreign_key => "user_id"

  validates :rating, inclusion: {in: 1..5}
end
