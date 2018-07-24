require 'rails_helper'

describe 'visitor sees a video show' do
  it 'vistor clicks on a tutorial title from the home page' do
    tutorial = create(:tutorial)
    video = create(:video, tutorial_id: tutorial.id)

    visit '/'

    click_on tutorial.title

    expect(current_path).to eq(tutorial_path(tutorial))

    click_on video.title

    expect(current_path).to eq(video_path(video))

    within('.video-container') do
      expect(page).to have_css('.video-view')
    end
  end
end
