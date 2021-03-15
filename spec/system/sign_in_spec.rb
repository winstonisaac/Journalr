require 'rails_helper'

RSpec.describe 'Log in process', type: :feature do
  let!(:user) { create :user}
  it 'should log in with correct details' do

    visit new_user_session_path
    within '#new_user' do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Log In'
    end

    expect(page).to have_content 'Signed in successfully.'
    expect(page.current_path).to eq categories_path
  end

  it 'should not log in with incorrect details' do

    visit new_user_session_path
    within '#new_user' do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password + "1"
      click_button 'Log In'
    end

    expect(page).to have_content 'Invalid Email or password.'
    expect(page.current_path).to eq new_user_session_path
  end
end