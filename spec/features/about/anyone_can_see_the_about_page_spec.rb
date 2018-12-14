require 'rails_helper'


describe "About" do

  it 'shows information about the app' do
    visit about_path
    string = "This application is designed to pull in youtube information to populate tutorials from Turing School of Software and Design's youtube channel. It's designed for anyone learning how to code, with additional features for current students."
    expect(page).to have_content(string)
  end
end
