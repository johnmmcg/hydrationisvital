class User < ApplicationRecord
  validates_presence_of :email, :daily_goal, :metric

  has_many :user_days
  has_many :days, through: :user_days

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
