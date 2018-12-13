require 'rails_helper'

describe 'Classroom Content (Tutorials)' do

  before(:each) do
    @classroom = create(:tutorial, classroom: true)
    @other     = create(:tutorial, classroom: false)
  end


  describe 'Visitor' do
    it 'Does not display classroom content' do
      visit '/'

      expect(page).to     have_content(@other.title)
      expect(page).to_not have_content(@classroom.title)
    end
  end

  describe 'User' do
    it "Displays classroom content " do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/'

      expect(page).to have_content(@other.title)
      expect(page).to have_content(@classroom.title)
    end
  end



end
