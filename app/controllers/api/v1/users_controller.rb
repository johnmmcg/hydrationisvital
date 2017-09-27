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
    # make all days and user_days for prev week
    filter_day = (Date.today.prev_week() + 2)
    while filter_day != (Date.today)
      if !Day.exists?(date: filter_day)
        new_day = Day.create(date: filter_day)
        new_user_day = UserDay.create(user_id: @user.id, day_id: new_day.id)
      else
        new_day = Day.find_by(date: filter_day)
        if !UserDay.exists?(day_id: new_day, user_id: @user.id)
          new_user_day = UserDay.create(user_id: @user.id, day_id: new_day.id)
        else
          new_user_day = UserDay.find_by(day_id: new_day.id, user_id: @user.id)
        end
        user_days << new_user_day
      end
      filter_day = (filter_day + 1)
    end

    @user_days_array = []
    user_days.each do |ud|
      @user_days_array <<
        {
          id: ud.id,
          date: ud.day.date.strftime('%m/%d/%Y'),
          weekday: ud.day.date.strftime('%A').downcase,
          weekdayAbbr: ud.day.date.strftime('%a').downcase,
          metric: ud.user.metric,
          amount: ud.amount,
          day: ud.day
        }
        if ud == @user_day
          @today = {
            id: ud.id,
            date: ud.day.date.strftime('%m/%d/%Y'),
            weekday: ud.day.date.strftime('%A').downcase,
            weekdayAbbr: ud.day.date.strftime('%a').downcase,
            metric: ud.user.metric,
            amount: ud.amount,
            day: ud.day
          }
        end
    end

    @user_days_array.sort_by! {|ud| ud[:date]}

    @recent_user_days = @user_days_array.select do |ud|
      ud[:day][:date] > Date.today - 4
    end

    data = {
      user: @user,
      user_days: @user_days_array,
      today: @today,
      recent_days: @recent_user_days
    }

    render json: data
  end
end
