require 'rails_helper'

describe 'admin visits their dashboard and sees a bar that displays various admin tools' do
  it 'sees a drop down for videos not in a playlist' do
    admin = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)


    visit dashboard_path

    expect(page).to have_content('New Videos')
  end
end
