require 'rails_helper'

describe 'visitor visits the home page' do
  it 'can see a list of videos' do
    visit '/'
    VCR.use_cassette('features/visitor_visits_home_page') do
      within(first('.videos')) do
        expect(page).to have_css('.video')
      end
    end
  end
end
