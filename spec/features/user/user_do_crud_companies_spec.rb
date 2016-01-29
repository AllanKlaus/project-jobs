require 'rails_helper'

feature 'User do CRUD on companies' do
  scenario 'user read companies' do

    array_companies = []
    5.times do |company|
      company = create_company(name: "Reading Company #{company}")
      array_companies << company.name
    end

    visit companies_path

    array_companies.each do |company_name|
      expect(page).to have_content company_name
    end
  end

  scenario 'user create companies' do
    login_user

    company = create_company
    visit new_company_path

    expect(page).to have_content 'Create Company'

    fill_in 'company[name]',     with: company.name
    fill_in 'company[location]', with: company.location
    fill_in 'company[mail]',     with: company.mail
    fill_in 'company[phone]',    with: company.phone

    click_on 'submit'

    expect(page).to have_content company.name
    expect(page).to have_content company.location
    expect(page).to have_content company.mail
    expect(page).to have_content company.phone
  end

  scenario 'user update company' do
    login_user

    company = create_company

    visit edit_company_path(company)

    expect(page).to have_content 'Edit Company'

    fill_in 'company[name]',     with: company.name
    fill_in 'company[location]', with: company.location
    fill_in 'company[mail]',     with: company.mail
    fill_in 'company[phone]',    with: company.phone

    click_on 'submit'

    expect(page).to have_content company.name
    expect(page).to have_content company.location
    expect(page).to have_content company.mail
    expect(page).to have_content company.phone
  end

  scenario 'user try to create an invalid company' do
    login_user

    visit new_company_path

    click_on 'submit'

    expect(page).to have_content "Warning: All fields are necessary"
  end

end
