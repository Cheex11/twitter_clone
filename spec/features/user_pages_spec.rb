require 'spec_helper'

describe User do
  context 'creating' do
    it 'creates a user' do
      visit root_path
      click_link 'Sign Up'
      fill_in 'Name', with: "Bill"
      fill_in 'Email', with: 'bill@bill.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'Create User'
      expect(page).to have_content 'User created'
    end
  end
  context 'session' do
    it 'signs a user out' do
      sign_up
      click_link 'Sign Out'
      expect(page).to have_content 'Sign In'
    end
    it 'creates a session' do
      user = create(:user)
      visit root_path
      click_link 'Sign In'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log In'
      expect(page).to have_content 'Log in successful!'
    end
  end
end



