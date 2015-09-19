require 'rails_helper'

describe 'the login page', type: :feature do
  before do
    User.create({email: "somedude@gmail.com", user_name: "somedude", password: "password", password_confirmation: "password" })
  end
  context 'when not currently signed in' do
    it 'displays a login form' do
      visit '/login'
      expect(page).to have_css('.login')
    end

    it 'redirects to index if valid credentials' do
      visit '/login'
      fill_in("Email", :with => 'somedude@gmail.com')
      fill_in("Password", :with => 'password')
      click_button('Login')

      expect(current_path).to eq('/')
    end
  end
end
