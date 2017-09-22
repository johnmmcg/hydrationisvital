class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @user = User.new
    render :new
  end

  # POST /resource
  def create

    @user = User.new(
      email: params[:user][:email],
      password: params[:user][:password],
      daily_goal: params[:user][:daily_goal],
      metric: params[:user][:metric]
    )
    if @user.save
      if Day.find_by(date: Date.today)
        @day = Day.find_by(date: Date.today)
      else
        @day = Day.create(date: Date.today)
      end

      if UserDay.find_by(user_id: @user.id, day_id: @day.id)
        @user_day = UserDay.find_by(user_id: @user.id, day_id: @day.id)
      else
        @user_day = UserDay.create(user_id: @user.id, day_id: @day.id )
      end
      binding.pry
      sign_in(:user, @user)
      redirect_to user_path(@user)
    else
      flash[:notce] = @user.errors.full_messages.join(', ')
      render :new
    end
  end

  # GET /resource/edit
  def edit
    @user = current_user
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    super
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
  end

  def after_update_path_for(resource)
    user_path(resource)
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end

end
