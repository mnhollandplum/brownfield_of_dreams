require 'rails_helper'

describe 'User' do

  before(:each) do
    @user = create(:user)
    @github_name = "iandouglas"
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit dashboard_path
    stub_user_repo_api_requests
    stub_user_following_api_requests
    stub_user_followers_api_requests
    click_on "Send Invite"
  end

  it 'links to invite path' do
    expect(page).to have_current_path(invite_path)
  end

  it 'can invite a github user' do
    stub_github_public_user_api_requests

    fill_in "Github Handle", with: @github_name
    click_on "Send Invite"

    expect(page).to have_current_path(dashboard_path)
    expect(page).to have_content( "Successfully sent invite!" )
  end

  it 'cannot invite a github user that does not exist' do
    stub_github_no_user_api_requests

    username = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxa"
    fill_in "Github Handle", with: username
    click_on "Send Invite"
    notice = "The Github user you selected doesn't have an email address associated with their account."

    expect(page).to have_current_path(dashboard_path)
    expect(page).to have_content( notice )
  end

  it 'cannot invite a github_user that does not have a public email' do
    stub_github_private_user_api_requests

    username = "kate-v2"
    fill_in "Github Handle", with: username
    click_on "Send Invite"
    notice = "The Github user you selected doesn't have an email address associated with their account."

    expect(page).to have_current_path(dashboard_path)
    expect(page).to have_content( notice )
  end

  it 'actually sent the email' do
    skip
    expect(page).to have_content("FAILING ON PURPOSE - ADD FEATURE AFTER MERGE")
  end



end


def page_me
  save_and_open_page
end
