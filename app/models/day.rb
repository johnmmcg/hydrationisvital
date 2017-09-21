class Day < ApplicationRecord
  validates_presence_of :date
  validates :date, uniqueness: true

  has_many :user_days
  has_many :users, through: :user_days
end
