require 'rails_helper'
require 'spec_helper'

feature 'OmniAuth Signup' do

 it 'sees a link to connect to github' do
   stub_user_repo_api_requests
   stub_user_followers_api_requests
   stub_user_following_api_requests

   user   = User.create!(email: "user@mail.com", first_name: "test", last_name: "user", password: "password")

   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

   visit dashboard_path

   expect(current_path).to eq dashboard_path
   expect(page).to have_link('Connect to Github')

   click_on 'Connect to Github'

   expect(current_path).to eq(dashboard_path)

   expect(page).to have_content('Repositories')
   expect(page).to have_content('Following')
   expect(page).to have_content('Followers')

 end
end
