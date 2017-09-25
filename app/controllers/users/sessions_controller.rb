class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  #
  # GET /resource/sign_in
  def new
    @user = User.new
    render :new
  end

  def show
    if !user_signed_in?
      redirect_to new_user_session_path
    else
      user = User.find(params[:id])
      render :show
    end
  end

  # POST /resource/sign_in
  def create
    if User.find_by(email: params[:user][:email])
      @user = User.find_by(email: params[:user][:email])
      if Day.find_by(date: Date.today)
        @day = Day.find_by(date: Date.today)
      else
        @day = Day.create(date: Date.today)
      end

      if UserDay.find_by(day_id: @day.id)
        @user_day = UserDay.find_by(day_id: @day.id)
      else
        @user_day = UserDay.create(user_id: @user, day_id: @day.id )
      end
      flash[:notce] = ""
      sign_in(:user, @user)
      redirect_to user_path(@user)
    else
      flash[:notice] = 'Invalid email or password. Please try again or sign up.'
      render 'devise/sessions/new'
    end
  end
  #
  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end

  def user_params
    params.require(:user).permit(:email, :password, :daily_goal, :metric)
  end
end
