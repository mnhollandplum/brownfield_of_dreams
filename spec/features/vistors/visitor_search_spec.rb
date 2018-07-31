require 'rails_helper'

describe 'As a visitor on the welcome page' do
  it 'can search for a tutorial' do
    tutorial1 = create(:tutorial)
    tutorial2 = create(:tutorial)
    tutorial3 = create(:tutorial)
    tutorial4 = create(:tutorial)

    video = create(:video, tutorial_id: tutorial1.id)

    visit '/'

    fill_in :search, with: tutorial1.title

    expect(page).to have_content(tutorial1.title)
    expect(page).to have_content(tutorial1.description)
    expect(page).to_not have_content(tutorial2.title)
    expect(page).to_not have_content(tutorial2.title)
  end
end
