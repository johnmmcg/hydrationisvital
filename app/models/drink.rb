class Drink < ApplicationRecord
  validates_presence_of :ammount, :user_day_id

  belongs_to :user_day
end
