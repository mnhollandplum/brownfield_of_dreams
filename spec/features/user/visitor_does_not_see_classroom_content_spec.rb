require 'rails_helper'

describe 'Classroom Content (Tutorials)' do

  before(:each) do
    @classroom = create(:tutorial, classroom: true)
    @other     = create(:tutorial, classroom: false)
  end


  describe 'Visitor' do
    it 'Root does not display classroom content' do
      visit '/'

      expect(page).to     have_content(@other.title)
      expect(page).to_not have_content(@classroom.title)
    end

    it 'Show does not display classroom content' do
      expect{ visit tutorial_path(@classroom) }.to raise_error(ActionController::RoutingError)
      expect{ visit tutorial_path(@other) }.to_not raise_error(ActionController::RoutingError)
    end
  end

  describe 'User' do

    before(:each) do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    it "Displays classroom content " do
      visit '/'

      expect(page).to have_content(@other.title)
      expect(page).to have_content(@classroom.title)
    end

    it 'Show can display classroom content' do
      expect{ visit tutorial_path(@other)     }.to_not raise_error(ActionController::RoutingError)
      expect{ visit tutorial_path(@classroom) }.to_not raise_error(ActionController::RoutingError)
    end
  end



end
