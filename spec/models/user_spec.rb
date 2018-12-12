require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :email }
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :password }
  end

  describe "Relationships" do
    it { should have_many :user_videos }
    it { should have_many :videos }

    it { should have_one  :github }

    it { should have_many :friendships }
    it { should have_many(:friends).through(:friendships) }
  end

  describe 'roles' do
    it 'can be created as default user' do
      user = User.create(email: 'user@email.com', password: 'password', first_name:'Jim', last_name:'Last1', role: 0)
      expect(user.role).to eq('default')
      expect(user.default?).to be_truthy
    end

    it 'can be created as an Admin user' do
      admin = User.create(email: 'admin@email.com', password: 'admin', first_name:'Bob', role: 1)
      expect(admin.role).to eq('admin')
      expect(admin.admin?).to be_truthy
    end
  end

  describe "Github delegated methods" do

    before(:each) do
      @user = User.create(email: 'user@email.com', password: 'password', first_name:'Jim', last_name:'Last1', role: 0)
      @github = Github.create(user: @user, username: 'username', token: "faketoken123", u_id: "123")
    end


    it "should have github_token" do
      expect(@user.github_token).to eq(@github.token)
    end
    it "should have github_u_id" do
      expect(@user.github_u_id).to eq(@github.u_id)
    end
    it "should have github_username" do
      expect(@user.github_username).to eq(@github.username)
    end

  end

  describe "Friendships" do

    before(:each) do
      @user    = User.create(email: 'user@email.com',    password: 'password', first_name:'Jim',     last_name: 'Last1', role: 0)
      @friend1 = User.create(email: 'friend1@email.com', password: 'password', first_name:'friend1', last_name: 'Last2', role: 0)
      @friend2 = User.create(email: 'friend2@email.com', password: 'password', first_name:'friend2', last_name: 'Last3', role: 0)
    end


    it "Should have friends" do
      expect(@user.friendships.count).to eq(0)
      @user.friendships.create(friend: @friend1)
      expect(@user.friendships.count).to eq(1)
      @user.friendships.create(friend: @friend2)
      expect(@user.friendships.count).to eq(2)

      expect(@user.friends.count).to eq(2)
      expect(@user.friends.first).to eq(@friend1)
      expect(@user.friends.last).to  eq(@friend2)
    end

    it 'Should not be able to add the same friend more than once' do
      expect(@user.friendships.count).to eq(0)
      @user.friendships.create(friend: @friend1)
      expect(@user.friendships.count).to eq(1)
      @user.friendships.create(friend: @friend1)
      expect(@user.friendships.count).to eq(1)
      @user.friendships.create(friend: @friend2)
      expect(@user.friendships.count).to eq(2)

      expect(@user.friends.count).to eq(2)
      expect(@user.friends.first).to eq(@friend1)
      expect(@user.friends.last).to  eq(@friend2)
    end


  end

  describe "Instance Methods" do
    it "can organize bookmarked videos of current user" do
    user = create(:user)
    video = create(:video)
    user_video = create(:user_video, user_id: user.id, video_id: video.id)

    expect(user.videos.count).to eq(1)
    expect(user.bookmarked_videos.first).to eq(video)

    end
  end


end
