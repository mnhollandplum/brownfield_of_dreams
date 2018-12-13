require 'rails_helper'

describe 'visitor sees a video show' do

  before(:each) do
    @tutorial = create(:tutorial)
  end

  it 'vistor clicks on a tutorial title from the home page' do
    video = create(:video, tutorial_id: @tutorial.id)

    visit '/'

    click_on @tutorial.title

    expect(current_path).to eq(tutorial_path(@tutorial))
    expect(page).to have_content(video.title)
    expect(page).to have_content(@tutorial.title)
  end

  it 'vistor sees a tutorial page with no videos' do
    visit '/'
    click_on @tutorial.title

    expect(current_path).to eq(tutorial_path(@tutorial))
    expect(page).to have_content(@tutorial.title)
  end
end
