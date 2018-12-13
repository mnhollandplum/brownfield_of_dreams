# require './app/models/github'
# require './app/models/poros/invite'


# Preview all emails at http://localhost:3000/rails/mailers/invite
class InvitePreview < ActionMailer::Preview

  def invite_github_user #(invite)
    user     = Github.first.user  # we need a token to do these invites
    username = "iandouglas"
    invite   = Invite.new(user, username)
    link     = register_path
    InviteMailer.invite_github_user(invite)
  end

end
