require 'active_support'
require 'active_support/core_ext'

class Api::V1::UsersController < ApiController

  def index
    users = User.all
    render json: users
  end

  def show
    @user = User.find(params[:id])
    if !Day.exists?(date: Date.today)
      @day = Day.create(date: Date.today)
      @user_day = UserDay.create(user_id: @user.id, day_id: @day.id)
    else
      @day = Day.find_by(date: Date.today)
      if !UserDay.exists?(day_id: @day.id, user_id: @user.id)
        @user_day = UserDay.create(user_id: @user.id, day_id: @day.id)
      else
        @user_day = UserDay.find_by(day_id: @day.id, user_id: @user.id)
      end
    end
    user_days = @user.user_days
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
        if ud == @user_day
          @today = {
            id: ud.id,
            date: ud.day.date.strftime('%m/%d/%Y'),
            weekday: ud.day.date.strftime('%A').downcase,
            metric: ud.user.metric,
            amount: ud.amount,
            day: ud.day
          }
        end
    end

    data = {
      user: @user,
      user_days: @user_days_array,
      today: @today
    }

    render json: data
  end
end
