require 'rails_helper'

RSpec.describe 'Sign up process', type: :feature do
  let!(:user) { attributes_for :user}
  let(:user_existing) { create :user}

  it 'should sign up with complete details' do
    visit new_user_registration_path
    within '#new_user' do
      fill_in 'user_first_name', with: user[:first_name]
      fill_in 'user_last_name', with: user[:last_name]
      fill_in 'user_email', with: user[:email]
      fill_in 'user_password', with: user[:password]
      fill_in 'user_password_confirmation', with: user[:password_confirmation]
      click_button 'Sign Up'
    end

    expect(page).to have_content 'Welcome! You have signed up successfully.'
    expect(page.current_path).to eq categories_path
  end
  
  it 'should not sign up when passwords do not match' do
    visit new_user_registration_path
    within '#new_user' do
      fill_in 'user_first_name', with: user[:first_name]
      fill_in 'user_last_name', with: user[:last_name]
      fill_in 'user_email', with: user[:email]
      fill_in 'user_password', with: user[:password]
      fill_in 'user_password_confirmation', with: user[:password_confirmation] + "1"
      click_button 'Sign Up'
    end

    expect(page).to have_content "Password confirmation doesn't match"
    expect(page.current_path).to eq user_registration_path
  end

  it 'should not sign up when email already exists' do
    visit new_user_registration_path
    within '#new_user' do
      fill_in 'user_first_name', with: user_existing.first_name
      fill_in 'user_last_name', with: user_existing.last_name
      fill_in 'user_email', with: user_existing.email
      fill_in 'user_password', with: user_existing.password
      fill_in 'user_password_confirmation', with: user_existing.password_confirmation
      click_button 'Sign Up'
    end

    expect(page).to have_content "Email has already been taken"
    expect(page.current_path).to eq user_registration_path
  end
end