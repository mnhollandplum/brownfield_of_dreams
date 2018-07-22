require 'rails_helper'

describe 'user visits the homepage' do
  it 'visits the home page and clicks sign in' do
    user = create(:user)

    visit root_path

    click_on 'Sign In'

    expect(current_path).to eq(login_path)

    fill_in'session[email]', with: user.email
    fill_in'session[password]', with: user.password

    click_on 'Log In'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content(user.email)
    expect(page).to have_content(user.first_name)
    expect(page).to have_content(user.last_name)
  end

  it 'can log out' do
    user = create(:user)

    visit login_path

    fill_in'session[email]', with: user.email
    fill_in'session[password]', with: user.password

    click_on 'Log In'

    click_on 'Sign Out'

    expect(current_path).to eq(root_path)

    expect(page).to have_content('Sign In')
  end
end
