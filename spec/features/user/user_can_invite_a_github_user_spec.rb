require 'rails_helper'

describe 'User' do

  before(:each) do
    @user = create(:user)
    @github_name = "iandouglas"
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  # it 'dashboard has a link to invite a user' do
  it 'can invite a github user' do
    visit dashboard_path

    stub_user_repo_api_requests
    stub_user_following_api_requests
    stub_user_followers_api_requests
    stub_github_public_user_api_requests

    click_on "Send Invite"
    expect(page).to have_current_path(invite_path)

    fill_in "Github Handle", with: @github_name
    click_on "Send Invite"

    expect(page).to have_current_path(dashboard_path)

    # binding.pry


  end

  it 'cannot invite a github user that does not exist' do
  # https://github.com/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxa
  end

  it 'cannot invite a github_user that does not have a public email' do

  end



end


def page_me
  save_and_open_page
end
