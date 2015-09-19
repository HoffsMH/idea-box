require 'rails_helper'

describe 'the sign up page', type: :feature do
  context 'when not currently signed in' do
    it 'displays a signup form' do
      visit '/users/new'
      expect(page).to have_css('.signup')
    end

    it 'redirects to index if valid credentials' do
      visit '/users/new'
      fill_in("email", :with => 'somedude@gmail.com')
      fill_in("User Name", :with => 'somedude')
      fill_in("Password", :with => 'password')
      fill_in("Confirm", :with => 'password')
      click_button('Create')

      expect(current_path).to eq('/')
    end

    it 'redirects to new if invalid credentials' do
      visit '/users/new'
      fill_in("email", :with => 'somedugmail.com')
      fill_in("User Name", :with => 'somedude')
      fill_in("Password", :with => 'pasfsfssword')
      fill_in("Confirm", :with => 'password')
      click_button('Create')

      expect(current_path).to eq('/users/new')
    end

    it 'adds the user if valid credentials' do
      count = User.all.count
      visit '/users/new'
      fill_in("email", :with => 'somedude@gmail.com')
      fill_in("User Name", :with => 'somedude')
      fill_in("Password", :with => 'password')
      fill_in("Confirm", :with => 'password')
      click_button('Create')

      expect(User.all.count).to eq(count +1)
    end
  end

  context 'when currently signed in' do
    it 'displays a message telling the user to sign out first' do
      visit '/login'
      fill_in("Email", :with => 'somedude@gmail.com')
      fill_in("Password", :with => 'password')
      click_button('Login')

      visit '/users/new'
      save_and_open_page
      expect(page).to have_content('Please sign out')
    end
  end
end
