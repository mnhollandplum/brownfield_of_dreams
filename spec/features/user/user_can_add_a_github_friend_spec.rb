require "rails_helper"

describe 'Github Friends' do

  before(:each) do
    @user    = User.create!(email: 'user@email.com',    password: 'password', first_name: 'Jim', last_name: "last1",  role: 0)
    @github  = Github.create!(user: @user, username: "user", token: "fake123", u_id: "123")

    # -- Follower via stub --
    @friend1 = User.create!(email: 'friend1@email.com', password: 'password', first_name: 'andrewetobin', last_name: "last2", role: 0)
    @github1 = Github.create!(user: @friend1, username: "andrewetobin", token: "fake456", u_id: "37811063")

    # -- Following via stub --
    @friend2 = User.create!(email: 'friend2@email.com', password: 'password', first_name: 'iandouglas', last_name: "last3", role: 0)
    @github2 = Github.create!(user: @friend2, username: "iandouglas", token: "fake456", u_id: "168030")

    Friendship.all.destroy_all

    stub_user_repo_api_requests
    stub_user_followers_api_requests
    stub_user_following_api_requests

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit dashboard_path

  end

  it "Add as Friend appears if a github follower is a member of our app" do
    section = page.find('.github-followers')
    expect(section).to have_selector(:link_or_button, 'Add as Friend')
    followers = section.find_all(".add-friend")
    expect(followers.count).to eq(1)
  end

  it "Add as Friend appears if a github following is a member of our app" do
    section = page.find('.github-following')
    expect(section).to have_selector(:link_or_button, 'Add as Friend')
    followers = section.find_all(".add-friend")
    expect(followers.count).to eq(2) # Andrew is also following
  end

  it "Clicking add as friend makes a friendship" do
    section = page.find('.github-followers')
    expect(section).to_not have_content("You are friends")
    expect(Friendship.count).to eq(0)

    within('.github-followers') do
      click_on "Add as Friend"
    end

    section = page.find('.github-followers')
    expect(page).to have_current_path(dashboard_path)
    expect(page).to    have_content("You've friended #{@user.friends.last.first_name}")

    expect(section).to have_content("You are friends")
    expect(Friendship.count).to eq(1)
  end

  it 'Refuses to add a friendship with a user that does not exist' do
    id = User.last.id + 1
    url = "/add_friend?friend=#{id}"
    page.driver.post(url)

    skip("capybara can't post, fix later")

    expect(page).to have_current_path(dashboard_path)
    expect(page).to have_content("That user does not exist.")
  end





end
