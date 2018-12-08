require 'rails_helper'
require 'spec_helper'

OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:github] = {
  provider: 'github',
  info: {
    name: 'first last',
    email: 'email@email.com'
  }
}

feature 'OmniAuth Signup' do
  scenario 'can sign up via Github' do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    click_link 'Connect to Github'

    visit '/auth/github/callback'

    expect(page).to have_content('Verify Details')
    click_button 'Signup'
    expect(page).to have_content('Signed in as email@email.com')
  end
end
# RSpec.feature "user logs into github" do
#   scenario "using github omniauth" do
#     stub_user_github_omniauth
#
#     user = create(:user)
#
#     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
#
#     visit dashboard_path
#
#     expect(page).to have_link("Connect to Github")
#
#     # click_link "Connect to Github"
#     visit '/auth/github/callback'
#
#     expect(current_path).to eq(github_callback_path)
#
#   end
# end
