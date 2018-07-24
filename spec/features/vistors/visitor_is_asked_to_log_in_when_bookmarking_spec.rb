require 'rails_helper'

describe 'visitor visits video show page' do
  it 'clicks on the bookmark page and is sent to the log in page' do
    video = create(:video)

    visit video_path(video)

    click_on 'Add to Bookmarks'

    expect(current_path).to eq(login_path)
  end
end
