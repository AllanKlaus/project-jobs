require 'rails_helper'

feature 'Visitor visits home' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_content 'Find Jobs'
  end
end
