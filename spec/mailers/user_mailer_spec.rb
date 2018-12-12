require "rails_helper"

RSpec.describe UserMailer, type: :mailer do

  describe "account_activation" do

    before(:each) do
      @user = create(:active_user)
      @user.activation_token = User.new_token
      @mail = UserMailer.account_activation( @user )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( @user )
    end

    let(:mail) { UserMailer.account_activation(@user) }

    it "renders the headers" do
      expect(@mail.subject).to eq( "Account Activation" )
      expect(@mail.to).to      eq( [@user.email] )
      expect(@mail.from).to    eq( ["no-reply@bfod.io"] )
    end

    it "renders the body" do
      expect(@mail.body.encoded).to match( @user.first_name )
      expect(@mail.body.encoded).to match( @user.activation_token )
      expect(@mail.body.encoded).to match( CGI.escape( @user.email ) )
    end
  end

end
