require 'rails_helper'

describe 'visitor visits the home page' do
  it 'can see a list of videos' do
    visit '/'

    within(first('.video')) do
      expect(page).to have_css('.title')
      expect(page).to have_css('.description')
    end
    
  end
end
