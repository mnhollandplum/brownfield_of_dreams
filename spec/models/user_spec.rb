require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:password)}
  end

  describe "Relationships" do
    it { should have_many :user_videos }
    it { should have_many :videos }
    it { should have_one  :github }
  end

  describe 'roles' do
    it 'can be created as default user' do
      user = User.create(email: 'user@email.com', password: 'password', first_name:'Jim', role: 0)

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
      @user = User.create(email: 'user@email.com', password: 'password', first_name:'Jim', role: 0)
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


end
