require "rails_helper"

describe 'Friends' do

  before(:each) do
    @user    = User.create!(email: 'user@email.com',    password: 'password', first_name: 'Jim', last_name: "user1",  role: 0)

    @friend1 = User.create!(email: 'friend1@email.com', password: 'password', first_name: 'friend1', last_name: "friendly1", role: 0)
    @user.friendships.create!(friend: @friend1)

    @friend2 = User.create!(email: 'friend2@email.com', password: 'password', first_name: 'friend2', last_name: "friendly2", role: 0)
    @user.friendships.create!(friend: @friend2)

    @not_friend = User.create!(email: 'not_friend@email.com', password: 'password', first_name: 'not-friend', last_name: "meanie", role: 0)

    stub_user_repo_api_requests
    stub_user_followers_api_requests
    stub_user_following_api_requests
    stub_user_email_api_requests
  end

  it 'Prints first and last name of each friend' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit dashboard_path

    section = page.find(".friends")
    friends = section.find_all("li")
    expect(friends.count).to eq(2)
    expect(friends.first).to     have_content("#{@friend1.first_name} #{@friend1.last_name}")
    expect(friends.last).to      have_content("#{@friend2.first_name} #{@friend2.last_name}")
    expect(friends.last).to_not  have_content("#{@not_friend.first_name} #{@not_friend.last_name}")
  end

  it 'Indicates if the user has no friends' do
    Friendship.all.destroy_all

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit dashboard_path

    section = page.find(".friends")
    friends = section.find_all("li")
    expect(friends.count).to eq(0)
    expect(section).to have_content("Link accounts to find friends.")
  end

end
