require 'active_support'
require 'active_support/core_ext'

class Api::V1::UsersController < ApiController

  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find(params[:id])
    user_days = user.user_days
    @user_days_array = []
    user_days.each do |ud|
      @user_days_array <<
        {
          id: ud.id,
          date: ud.day.date.strftime('%m/%d/%Y'),
          weekday: ud.day.date.strftime('%A').downcase,
          metric: ud.user.metric,
          amount: ud.amount,
          day: ud.day
        }
    end

    data = {
      user: user,
      user_days: @user_days_array,
      today: @user_days_array[-1]
    }

    render json: data
  end
end
