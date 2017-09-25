class Api::V1::UserDaysController < ApiController

  def index
    user_days = UserDay.all

    render json: user_days
  end

  def show
    if !Day.exists?(date: Date.today)
      @day = Day.create(date: Date.today)
      @user_day = UserDay.create(user_id: current_user.id, day_id: @day.id)
    else
      @day = Day.find_by(date: Date.today)
      if !UserDay.exists?(day_id: @day.id)
        @user_day = UserDay.create(user_id: current_user.id, day_id: @day.id)
      else
        @user_day = UserDay.find_by(user_id: current_user.id, day_id: @day.id)
      end
    end
    user_day = UserDay.find(params[:id])
    id = user_day.id
    amount = user_day.amount
    user = user_day.user
    day = user_day.day

    data = {
      id: id,
      amount: amount,
      user: user,
      today: {
        id: user_day.id,
        date: user_day.day.date.strftime('%m/%d/%Y'),
        weekday: user_day.day.date.strftime('%A').downcase,
        metric: user_day.user.metric,
        amount: user_day.amount,
        day: user_day.day
      }
    }

    render json: data
  end

  def update
    user_day = UserDay.find(params[:id])
    id = user_day.id
    newAmount = request.body.read.to_i
    user_day.amount = newAmount
    user_day.save
    amount = user_day.amount
    user = user_day.user
    day = user_day.day

    data = {
      id: id,
      amount: amount,
      user: user,
      today: {
        id: user_day.id,
        date: user_day.day.date.strftime('%m/%d/%Y'),
        weekday: user_day.day.date.strftime('%A').downcase,
        metric: user_day.user.metric,
        amount: user_day.amount,
        day: user_day.day
      }
    }

    render json: data
  end
end
