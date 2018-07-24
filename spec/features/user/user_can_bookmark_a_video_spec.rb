require 'rails_helper'

describe 'as a registered user' do
  it 'can add videos to their bookmarks' do
    video = create(:video)
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit video_path(video)

    click_on 'Add to Bookmarks'

    expect(page).to have_content("Video added to your dashboard!")
  end
end
