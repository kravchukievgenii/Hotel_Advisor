require 'spec_helper'

describe "Users sign in GET /users/sign_in" do
  it 'should sign in user' do 
    user = create :user 
    visit new_user_session_path
    fill_in "Email",    with: user.email
    fill_in "Password", with: 'userpassword'
    click_button "Sign in"
    expect(page.status_code).to be 200
    expect(page).to have_content 'Add Hotel'
  end
end

describe "Users sign up GET /users/sign_up" do
  it 'should sign up user' do
    visit new_user_registration_path
    fill_in "Email",    with: 'user@example.com'
    fill_in "Password", with: 'userpassword'
    fill_in "Password confirmation", with: 'userpassword'
    click_button "Sign up"
    expect(page.status_code).to be 200
    expect(page).to have_content 'Add Hotel'
  end
end

describe "Users sign out GET /users/sign_out" do
  it 'should sign out user' do
    user = create :user 
    visit new_user_session_path
    fill_in "Email",    with: user.email
    fill_in "Password", with: 'userpassword'
    click_button "Sign in"
    expect(page.status_code).to be 200
    expect(page).to have_content 'Sign out'
    click_link 'Sign out'
    expect(page).to have_content 'Sign in'
  end
end