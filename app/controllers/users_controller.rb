class UsersController < ApplicationController

  def show
    @dashboard_facade = DashboardFacade.new(current_user)
  end

  def new
    @user = User.new
  end

  def create
    hash = {:activation_token => User.new_token}
    user = User.create!(user_params.merge(hash))
    if user.save
      session[:user_id] = user.id
      UserMailer.account_activation(user).deliver_now
      flash[:info] = "Please check your email to activate your account."
      redirect_to dashboard_path
    else
      flash[:error] = 'Username already exists'
      render :new
    end
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end

end
