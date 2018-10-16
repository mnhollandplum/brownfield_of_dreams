require 'rails_helper'

describe 'A registered user' do
  it 'can add videos to their bookmarks' do
    tutorial= create(:tutorial)
    video = create(:video, tutorial_id: tutorial.id)
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit tutorial_path(tutorial)

    click_on 'Bookmark'

    expect(page).to have_content("Bookmark added to your dashboard")
    expect(user.videos.last.title).to eq(video.title)

    click_on "Profile"

    expect(current_path).to eq(dashboard_path)

    expect(page).to have_content(tutorial.title)
    expect(page).to have_content(video.title)
  end

  it "can't add the same bookmark more than once" do
    tutorial= create(:tutorial)
    video = create(:video, tutorial_id: tutorial.id)
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit tutorial_path(tutorial)

    click_on 'Bookmark'
    expect(page).to have_content("Bookmark added to your dashboard")
    click_on 'Bookmark'
    expect(page).to have_content("Already in your bookmarks")
  end

  it "can delete the bookmark from their dashboard" do
    tutorial= create(:tutorial)
    video = create(:video, tutorial_id: tutorial.id)
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit tutorial_path(tutorial)

    click_on 'Bookmark'

    expect(page).to have_content("Bookmark added to your dashboard")
    expect(user.videos.last.title).to eq(video.title)

    click_on "Profile"

    expect(current_path).to eq(dashboard_path)

    within(".segment-#{video.id}") do
      click_on "Remove"
    end

    expect(page).to have_content("Bookmark removed")
    expect(current_path).to eq(dashboard_path)
  end

end
