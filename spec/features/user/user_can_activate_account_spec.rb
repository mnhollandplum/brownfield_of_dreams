require "rails_helper"

describe "Account Activation" do

  it 'can reach register path' do
    visit '/'
    click_on "Register"
    expect(page).to have_current_path(register_path)
  end

  describe "New User" do
    before(:each) do
      visit '/'
      click_on "Register"
      fill_in 'user[email]',                  with: "new_user@mail.com"
      fill_in 'user[first_name]',             with: "first"
      fill_in 'user[last_name]',              with: "last"
      fill_in 'user[password]',               with: "password"
      fill_in 'user[password_confirmation]',  with: "password"
      click_on "Create Account"
    end

    it 'Can be redirected to dashboard' do
      expect(page).to have_current_path(dashboard_path)
      expect(page).to have_content("Logged in as #{"first"}")
    end

    it 'page indicates user should activate account' do
      notice = "This account has not yet been activated. Please check your email to activate your account."
      expect(page).to have_content(notice)
    end

    it 'upon activation, it says thank you' do
      user = User.last
      # binding.pry
      # visit edit_account_activation_path(user.activation_token, email: user.email)
      visit edit_account_activation_path(user.activation_digest, email: user.email)

      expect(user.activated).to eq("active")

      # visit update_account_activation_path(user.activation_token, email: user.email, id:0)

      binding.pry
    end




  end

end
