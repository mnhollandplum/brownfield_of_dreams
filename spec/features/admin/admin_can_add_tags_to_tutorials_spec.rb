require 'rails_helper'

describe 'An admin user can add tags to tutorials' do
  it 'clicks on the add tag on a tutoral', :js do
    admin = create(:user, role: 1)
    tutorial = create(:tutorial)
    video1 = create(:video, tutorial_id: tutorial.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit root_path

    within(".edit-tutorial#{tutorial.id}") do
      click_on 'Edit Tag'
    end

    expect(current_path).to eq(edit_admin_tutorial_path(tutorial))
  end

  it 'can add a tag to a tutorial and filter by tag', :js do
    ruby = "Ruby"
    admin = create(:user, role: 1)
    tutorial1 = create(:tutorial)
    tutorial2 = create(:tutorial)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit root_path

    within(".edit-tutorial#{tutorial1.id}") do
      click_on 'Edit Tag'
    end

    fill_in'tutorial[tag_list]', with: ruby

    click_on "Update Tutorial"

    visit root_path

    within(".categories") do
      expect(page).to have_content(ruby)
    end

    within(".categories") do
      click_on ruby
    end

    expect(current_path).to eq("/tags/#{ruby}")
  end
end
