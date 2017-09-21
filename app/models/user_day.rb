class UserDay < ApplicationRecord
  validates_presence_of :user_id, :day_id

  belongs_to :user
  belongs_to :day
end
