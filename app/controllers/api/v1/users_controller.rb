class Api::V1::UsersController < ApplicationController

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
          day: ud.day,
          metric: ud.user.metric,
          amount: ud.amount
        }
    end
    data = {
      user: user,
      user_days: @user_days_array
    }

    render json: data
  end
end
