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
  end
end
