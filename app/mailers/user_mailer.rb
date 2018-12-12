class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def account_activation(new_user)
    @user = new_user
    @greeting = "Hi #{@user.first_name},"
    @link = edit_account_activation_url(@user.activation_token, email: @user.email)
    mail to: @user.email, subject: "Account Activation"
  end
end
