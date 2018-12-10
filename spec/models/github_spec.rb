require 'rails_helper'

RSpec.describe Github, type: :model do

  describe "Validation" do
    it { should validate_presence_of :token }
    it { should validate_presence_of :username }
    it { should validate_presence_of :u_id }
  end

  describe "Relationship" do
    it { should belong_to :user }
  end

end
