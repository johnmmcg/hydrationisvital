class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  #
  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    if !Day.exists?(date: Date.today)
      @day = Day.create(date: Date.today)
      @user_day = UserDay.create(user_id: current_user.id, day_id: @day.id)
      @drink = Drink.create(user_day_id: @user_day.id, amount: 0)
    end
    super
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
end
