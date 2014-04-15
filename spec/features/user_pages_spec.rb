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
end



