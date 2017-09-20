class UserDay < ApplicationRecord
  validates_presence_of :user_id, :day_id, :amount

  validates :amount, numericality: {
    greater_than_or_equal_to: 0
  }

  belongs_to :user
  belongs_to :day
end
