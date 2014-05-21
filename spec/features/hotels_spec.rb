require 'spec_helper'

def sign_in(user)
  visit new_user_session_path
  fill_in "Email",    with: user.email
  fill_in "Password", with: 'userpassword'
  click_button "Sign in"
end

describe "Hotel new GET /hotels/new" do
  it 'should show form for add new hotel' do 
    user = create :user
    sign_in user
    visit new_hotel_path
    expect(page).to have_content 'New hotel'
    expect(page).to have_content 'Title'
    expect(page).to have_content 'Room description'
    expect(page).to have_content 'Photo'
    expect(page).to have_content 'Price'
    expect(page).to have_content 'Breakfast included'
    expect(page).to have_content 'Hotel address'
    expect(page).to have_content 'Country'
    expect(page).to have_content 'State'
    expect(page).to have_content 'City'
    expect(page).to have_content 'Street'
  end

  it 'should create new hotel' do 
    user = create :user
    sign_in user
    visit new_hotel_path
    fill_in 'Title', with: 'Hotel title' 
    fill_in 'Room description', with: 'Hotel room description'
    fill_in 'Price', with: 32 
    fill_in 'Country', with: 'Country' 
    fill_in 'State', with: 'State'
    fill_in 'City', with: 'City'
    fill_in 'Street', with: 'Street' 
    click_button "Create Hotel"
    expect(current_path).to eq "/hotels/" + Hotel.last.id.to_s
    expect(page).to have_content 'Hotel title'
  end
end



describe "Hotel" do
  before(:each) { sign_in create :user }
  before(:each) { create :hotel, :address => FactoryGirl.create(:address) }

  it 'should show list of hotels' do 
    visit hotels_path
    
    expect(page).to have_content 'title'
    expect(page).to have_content 'hotel room description'
  end

  it 'address should be present' do 
    visit hotels_path

    expect(page).to have_content 'country'
    expect(page).to have_content 'state'
    expect(page).to have_content 'city'
    expect(page).to have_content 'street'
  end

   it 'should access to the details' do 
    visit hotels_path
    click_link ('Details')

    expect(page).to have_content 'title'
    expect(page).to have_content 'hotel room description'
    expect(page).to have_content 'country'
    expect(page).to have_content 'state'
    expect(page).to have_content 'city'
    expect(page).to have_content 'street'
  end

  it 'should live comment' do
    visit hotels_path
    click_link ('Details')

    fill_in "comment_content", with: 'i_don\'t_know_what_to_write'
    click_button ('Comment')
    expect(page).to have_content 'i_don\'t_know_what_to_write'
  end
end