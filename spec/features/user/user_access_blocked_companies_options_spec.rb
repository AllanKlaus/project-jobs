require 'rails_helper'

feature 'User access blocked company options' do
  scenario 'user unlogged access new company' do
    create_company
    visit new_company_path

    expect(page).to have_content "Log in"
  end

  scenario 'user unlogged access update company' do
    company = create_company

    visit edit_company_path(company)

    expect(page).to have_content "Log in"
  end
end
