require 'rails_helper'

describe 'User' do
  before(:each) do
    stub_user_api_requests
  end
  it 'user can sign in' do
    user = create(:user)
       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

       VCR.use_cassette("github_token") do
         visit '/dashboard'

         expect(page).to have_content("Github")
         expect(page).to have_css(".user_repos", count: 5)
       end


  end
end
