class Day < ApplicationRecord
  has_many :user_days
  has_many :drinks, through: :user_days
  has_many :users, through: :user_days
end
