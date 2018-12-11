require "rails_helper"

describe 'Github Friends' do

  before(:each) do
    @user    = User.create!(email: 'user@email.com',    password: 'password', first_name:'Jim',  role: 0)
    @github  = Github.create!(user: @user, username: "user", token: "fake123", u_id: "123")

    # -- Follower via stub --
    @friend1 = User.create!(email: 'friend1@email.com', password: 'password', first_name: 'andrewetobin', role: 0)
    @github1 = Github.create!(user: @friend1, username: "andrewetobin", token: "fake456", u_id: "37811063")

    # -- Following via stub --
    @friend2 = User.create!(email: 'friend2@email.com', password: 'password', first_name: 'iandouglas', role: 0)
    @github2 = Github.create!(user: @friend2, username: "iandouglas", token: "fake456", u_id: "168030")

    Friendship.all.destroy_all

    stub_user_repo_api_requests
    stub_user_followers_api_requests
    stub_user_following_api_requests
  end


  it "Add as Friend appears if a github follower is a member of our app" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit dashboard_path

    followers = page.find('.github-followers')
    expect(followers.find_all(".add-friend").count).to eq(1)
    expect(followers).to have_content("Add as Friend")
  end

  it "Add as Friend appears if a github following is a member of our app" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit dashboard_path

    followers = page.find('.github-following')
    expect(followers.find_all(".add-friend").count).to eq(2) # Andrew is also following
    expect(followers).to have_content("Add as Friend")
  end

  it "Clicking add as friend makes a friendship" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit dashboard_path

    expect(page.find('.github-followers')).to_not have_content("You are friends")
    expect(Friendship.count).to eq(0)

    skip('TODO -- GET request issue')

    within('.github-followers') do
      click_on "Add as Friend"
    end

    expect(page).to have_current_path(dashboard_path)
    expect(page.find('.github_followers')).to have_content("You are friends")
    expect(Friendship.count).to eq(1)
  end





end
