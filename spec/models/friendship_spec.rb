require 'rails_helper'

RSpec.describe Friendship, type: :model do

  describe "Relationships" do
    it { should belong_to :user }
    it { should belong_to :friend }
  end

  describe "can return user and friend objects" do

    before(:each) do
      @user    = User.create(email: 'user@email.com',    password: 'password', first_name:'Jim',  role: 0)
      @friend1 = User.create(email: 'friend1@email.com', password: 'password', first_name:'friend1', role: 0)
      @friendship = Friendship.create(user: @user, friend: @friend1)
    end

    it 'Should return the user' do
      expect(@friendship.user).to eq(@user)
    end

    it 'Should return the friend' do
      expect(@friendship.friend).to eq(@friend1)
    end


  end

end
