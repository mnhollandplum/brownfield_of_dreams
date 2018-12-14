require 'rails_helper'

describe 'vister can create an account', :js do
  it ' visits the home page' do
    email = 'jimbob@aol.com'
    first_name = 'Jim'
    last_name = 'Bob'
    password = 'password'
    password_confirmation = 'password'
    stub_user_repo_api_requests
    stub_user_followers_api_requests
    stub_user_following_api_requests

    visit '/'

    click_on 'Sign In'

    expect(current_path).to eq(login_path)

    click_on 'Sign up now.'

    expect(current_path).to eq(new_user_path)

    fill_in 'user[email]', with: email
    fill_in 'user[first_name]', with: first_name
    fill_in 'user[last_name]', with: last_name
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password

    click_on'Create Account'

    expect(current_path).to eq(dashboard_path)

    expect(page).to have_content(email)
    expect(page).to have_content(first_name)
    expect(page).to have_content(last_name)
    expect(page).to_not have_content('Sign In')
  end
  # it 'renders a new form when inadequate info is provided' do
  #   email = 'jimbob@aol.com'
  #   first_name = 'Jim'
  #   last_name = 'Bob'
  #   password = 'password'
  #   password_confirmation = ''
  #   stub_user_repo_api_requests
  #   stub_user_followers_api_requests
  #   stub_user_following_api_requests
  #
  #   visit '/'
  #
  #   click_on 'Sign In'
  #
  #   expect(current_path).to eq(login_path)
  #
  #   click_on 'Sign up now.'
  #
  #   expect(current_path).to eq(new_user_path)
  #
  #   fill_in 'user[email]', with: nil
  #   fill_in 'user[first_name]', with: first_name
  #   fill_in 'user[last_name]', with: nil
  #   fill_in 'user[password]', with: password
  #   fill_in 'user[password_confirmation]', with: password_confirmation
  #
  #   click_on'Create Account'
  #
  #   expect(current_path).to eq(new_user_path)
  #   assert_template :new
  # end
 #
 #  it 'does not allow you to register if email is taken' do
 #    user   = User.create!(email: "user@mail.com", first_name: "test", last_name: "user", password: "password")
 #
 #    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
 #
 #   visit register_path
 #
 #   fill_in 'user[email]', with: 'user@mail.com'
 #   fill_in 'user[first_name]', with: 'Username'
 #   fill_in 'user[last_name]', with: 'Test'
 #   fill_in 'user[password]', with: '1234'
 #   fill_in 'user[password_confirmation]', with: '1234'
 #   click_on'Create Account'
 #
 #   expect(page).to have_content('Username already exists')
 #   expect(current_path).to eq(register_path)
 # end
end
