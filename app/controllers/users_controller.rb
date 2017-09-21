class UsersController < ApplicationController

  def new
    user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "success!"
      if !Day.exists?(date: Date.today)
        @day = Day.create(date: Date.today)
        @user_day = UserDay.create(user_id: current_user.id, day_id: @day.id)
        @drink = Drink.create(user_day_id: @user_day.id, ammount: 0)
      end
      redirect_to user_path(@user)
    else
      flash[:notice] = @user.errors.full_messages.join(', ')
      render 'registrations/new'
    end
  end

  def show
    if !user_signed_in?
      redirect_to new_user_session_path
    else
      user = User.find(params[:id])
      render :show
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :daily_goal, :metric)
  end
end
