require 'spec_helper'

describe Tweet do
  context 'creating' do
    it 'creates a tweet' do
      sign_up
      click_link 'Write Tweet'
      expect(page).to have_content 'New tweet:'
      fill_in 'Text', with: 'Hey there!'
      click_button 'Create Tweet'
      page.should have_content 'Hey there!'
    end
  end
end
