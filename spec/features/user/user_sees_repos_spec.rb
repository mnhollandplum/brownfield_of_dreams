require 'rails_helper'

describe 'User' do
  before(:each) do
    stub_user_api_requests
  end



    VCR.use_cassette("github_token") do
      it 'user can sign in' do
        user = create(:user)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit dashboard_path

      expect(page).to have_content(user.first_name)
      expect(page).to have_content(user.last_name)

      expect(page).to have_content("Github")
      expect(page).to have_css(".user_repos", count: 5)
    end
  end

  # it 'does not see the "Github" section if the user is missing a Github token' do
  #   no_github = User.create!(email: "not a github user", first_name: "test", last_name: "user", password: "password", github_token: nil)
  #
  #   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(no_github)
  #
  #   visit dashboard_path
  #
	# 	expect(page).to have_content(no_github.first_name)
	# 	expect(page).to have_content(no_github.last_name)
  #
	# 	expect(page).to_not have_css(".user_repos")
  #
  # end
end
