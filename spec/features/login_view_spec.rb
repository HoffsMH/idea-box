require 'rails_helper'

describe 'the login page', type: :feature do
  
  context 'when not currently signed in' do
    it 'displays a login form' do
      visit '/login'
      expect(page).to have_css('.login')
    end

    it 'redirects to index if valid credentials' do
      visit '/login'
      fill_in("email", :with => 'somedude@gmail.com')
      fill_in("User Name", :with => 'somedude')
      fill_in("Password", :with => 'password')
      fill_in("Confirm", :with => 'password')
      click_button('Create')

      expect(current_path).to eq('/')
    end
  end
end
