require 'rails_helper'
require 'spec_helper'

feature 'OmniAuth Signup' do

 it 'sees a link to connect to github' do
   stub_user_repo_api_requests
   stub_user_followers_api_requests
   stub_user_following_api_requests
   stub_omniauth

   user = create(:user, email: 'test@mail.com')
   visit login_path
   fill_in 'session[email]', with: user.email
   fill_in 'session[password]', with: user.password

   click_on 'Log In'

   expect(current_path).to eq dashboard_path
   expect(page).to have_link('Connect to Github')

   click_on 'Connect to Github'

   expect(current_path).to eq(dashboard_path)


   expect(page).to have_content('Repositories')
   expect(page).to have_content('Following')
   expect(page).to have_content('Followers')

 end
end
