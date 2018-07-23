require 'rails_helper'

describe 'visitor sees a video show' do
  it 'vistor clicks on a video title from the home page' do
    visit '/'

    save_and_open_page

    click_on 'Test Ten'

    expect(current_path).to eq('/video')
    within('.video-container') do
      expect(page).to have_css('.video-view')
    end
  end
end
