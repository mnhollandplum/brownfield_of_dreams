require "rails_helper"


describe "Anyone" do

  it 'can visit the get started page' do
    visit get_started_path
    expect(page).to have_content("Browse tutorials from the homepage.")
    expect(page).to have_content("Filter results by selecting a filter on the side bar of the homepage.")
    expect(page).to have_content("Register to bookmark segments.")
    expect(page).to have_content("Sign in with census if you are a current student for addition content.")
  end

end
