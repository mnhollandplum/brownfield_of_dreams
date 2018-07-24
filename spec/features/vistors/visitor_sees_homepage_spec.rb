require 'rails_helper'

describe 'visitor visits the home page' do
  it 'can see a list of tutorials' do
    tutorial_list = create_list(:tutorial, 5)
    video1 = create(:video, tutorial_id: tutorial_list[0].id)
    video2 = create(:video, tutorial_id: tutorial_list[1].id)
    video3 = create(:video, tutorial_id: tutorial_list[2].id)
    video4 = create(:video, tutorial_id: tutorial_list[3].id)
    video5 = create(:video, tutorial_id: tutorial_list[4].id)

    visit '/'

    expect(page).to have_css('.tutorial', count: 5)

      within(first('.tutorials')) do
        expect(page).to have_css('.tutorial')
        expect(page).to have_css('.tutorial-description')
        expect(page).to have_content(tutorial_list[0].title)
        expect(page).to have_content(tutorial_list[0].description)
      end
  end
end
