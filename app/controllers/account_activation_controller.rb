
class AccountActivationController < ApplicationController

  def edit
  # def update
    email = params[:email]
    token = params[:id]
    user  = User.find_by(email: email)
    binding.pry

    # if user && user.authenticated?(:activation, token)
    # if user && (user.activated == 0) && user.authenticated?(:activation, token)
    if user && (user.activated == 'pending') && user.authenticated?(:activation, token)
      # binding.pry
      user.update_attribute(:activated, 1)
      binding.pry
      log_in user
      flash[:success] = "Account activated!"
      redirect_to dashboard_path
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end

  end



end
