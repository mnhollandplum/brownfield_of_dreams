
class SessionsController < ApplicationController

  def new
    @user ||= User.new
  end

  def create
    user = User.find_by(email: params[:session][:email])

    if user && user.authenticate(params[:session][:password])

      if user.activated?
        binding.pry
        # log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        message  = "Account not activated. Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
      session[:user_id] = user.id
      redirect_to dashboard_path

    else
      flash[:error] = "Looks like your email or password is invalid"
      render :new
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
