class InviteMailer < ApplicationMailer

  def invite_github_user(invite)
    @invite  = invite
    @link    = register_url
    app_name = "Brownfield"
    # ^^ make app self aware -- https://stackoverflow.com/questions/3539148/how-do-i-access-the-name-of-the-rails-3-application-object
    mail to: invite.get_github_email, subject: "#{@invite.sender_github_name} has invited you to join #{app_name}!"
  end

end
