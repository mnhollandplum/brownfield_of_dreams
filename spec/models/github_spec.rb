require 'rails_helper'

RSpec.describe Github, type: :model do

  describe "Validations" do
    it { should validate_presence_of :token }
    it { should validate_presence_of :username }
    it { should validate_presence_of :u_id }
    it { should validate_uniqueness_of :u_id }
  end

  describe "Relationships" do
    it { should belong_to :user }
  end

end
