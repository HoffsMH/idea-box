require 'rails_helper'

describe 'the sign up page', type: :feature do
  context 'when not currently signed in' do
    it 'displays a signup form' do
      visit '/users/new'
      expect(page).to have_css('.signup')
    end
  end
end
