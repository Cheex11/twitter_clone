def sign_up
  visit root_path
      click_link 'Sign Up'
      user_name = Faker::Name.name
      fill_in 'Name', with: user_name
      fill_in 'Email', with: Faker::Internet.email
      password = Faker::Internet.password
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password
      click_button 'Create User'
end
