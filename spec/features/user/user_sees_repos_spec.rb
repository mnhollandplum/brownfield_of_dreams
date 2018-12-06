require 'rails_helper'

describe 'User' do
  describe 'Github User' do
    before(:each) do
      stub_user_repo_api_requests
      stub_user_followers_api_requests
      stub_user_following_api_requests
    end
        it 'user can see github repos in' do
        user =  User.create!(email: "user@mail.com", first_name: "test", last_name: "user", password: "password", github_token: ENV["github_user_token"])
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit dashboard_path

        expect(page).to have_content(user.first_name)
        expect(page).to have_content(user.last_name)

        expect(page).to have_content("Github")
        expect(page).to have_css(".github-repos li", count: 5)
      end
  end
  describe 'Non-Github User' do

    it 'does not see the "Github" section if the user is missing a Github token' do
      no_github = User.create!(email: "user@mail.com", first_name: "test", last_name: "user", password: "password", github_token: nil)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(no_github)

      visit dashboard_path

  		expect(page).to have_content(no_github.first_name)
  		expect(page).to have_content(no_github.last_name)

  		expect(page).to_not have_content("Repositories")
  		expect(page).to_not have_content("Github")
    end
  end
end
