require 'rails_helper'

describe 'An admin user can add tags to tutorials' do
  it 'clicks on the add tag on a tutoral' do
    admin = create(:user, role: 1)
    tutorial = create(:tutorial)
    video1 = create(:video, tutorial_id: tutorial.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit '/'
    
    within(".edit-tutorial#{tutorial.id}") do
      click_on 'Add Tag'
    end

    expect(current_path).to eq(tutoral_path(tutoral))

  end
end
