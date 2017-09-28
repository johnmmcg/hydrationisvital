class UsersController < ApplicationController

  def new
    user = User.new
    render 'devise/registrations/new'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "success!"
      if !Day.exists?(date: Date.today)
        @day = Day.create(date: Date.today)
        @user_day = UserDay.create(user_id: @user.id, day_id: @day.id)

      else
        @day = Day.find_by(date: Date.today)
        if !UserDay.exists?(day_id: @day.id)
          @user_day = UserDay.create(user_id: @user.id, day_id: @day.id)
        end
      end
      sign_in(:user, @user)
      redirect_to user_path(@user)
    else
      flash[:notice] = @user.errors.full_messages.join(', ')
      render 'registrations/new'
    end
  end

  def show
    @user = User.find(params[:id])
    if current_user == @user
      render :show
    else
      redirect_to new_user_session_path
    end
  end

  def update
    @user = User.find(current_user.id)
    if @user.update_attributes(user_params)
      flash[:notice] = "success!"
      sign_in @user
      redirect_to user_path(@user)
    else
      flash[:notice] = @user.errors.full_messages.join(', ')
      render 'devise/registrations/edit'
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :daily_goal, :metric)
  end
end
