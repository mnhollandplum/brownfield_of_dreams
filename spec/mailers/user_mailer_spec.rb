require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "account_activation" do
    it "email is created with user information" do
    user = create(:user)
    user.activation_token = User.new_token
    mail = UserMailer.account_activation(user)

    assert_equal [user.email], mail.to
    assert_equal "Account activation",    mail.subject
    assert_equal ["noreply@example.com"], mail.from
    assert_match user.first_name,         mail.body.encoded
    assert_match user.activation_token,   mail.body.encoded
    assert_match CGI.escape(user.email),  mail.body.encoded
    end
  end
end
