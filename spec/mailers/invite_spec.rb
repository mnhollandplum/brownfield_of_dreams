require "rails_helper"

require './app/models/poros/invite'


RSpec.describe InviteMailer, type: :mailer do

  describe "Invite a Github user" do

    before(:each) do
      stub_github_public_user_api_requests

      @sender   = "noreply@example.com"
      @username = "iandouglas"

      @user     = create(:user, activated: true)
      @invite   = Invite.new(@user, @username)
      @email    = @invite.get_github_email
      @inviter  = @invite.sender_github_name

      @link     = register_url
      @app_name = "Brownfield"

      @mailer   = InviteMailer.invite_github_user(@invite)
    end



    it 'email is created with public github user information' do
      assert_equal [@email],  @mailer.to
      assert_equal [@sender], @mailer.from

      subject  = "#{@inviter} has invited you to join #{@app_name}!"
      greeting = "Hello #{@username}"
      link     = @link
      message  = "#{@inviter} has invited you to join #{@app_name}. You can create an account here."

      assert_equal subject,   @mailer.subject
      assert_match greeting,  @mailer.body.encoded
      assert_match message,   @mailer.body.encoded
      assert_match link,      @mailer.body.encoded
      assert_match "here",    @mailer.body.encoded
    end
  end

end
