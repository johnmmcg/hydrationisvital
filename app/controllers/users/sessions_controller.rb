class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  #
  # GET /resource/sign_in
  def new
    super
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
    @user = current_user
    Day.create(date: Date.today)
    UserDay.create(user_id: @user.id, day_id: Day.last.id)
    redirect_to user_path(@user)
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
