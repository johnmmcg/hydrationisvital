class Api::V1::UserDaysController < ApiController

  def index
    user_days = UserDay.all
    
    render json: user_days
  end

  def show
    user_day = UserDay.find(params[:id])
    id = user_day.id
    amount = user_day.amount
    user = user_day.user
    day = user_day.day

    data = {
      id: id,
      amount: amount,
      user: user,
      day: day
    }

    render json: data
  end

end
