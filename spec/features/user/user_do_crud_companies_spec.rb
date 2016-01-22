require 'rails_helper'

feature 'User do CRUD on companies' do
  scenario 'user read companies' do

    5.times do |company|
      Company.create(
      name: "Reading Company #{company}",
      location: 'Guarujá',
      mail: 'created@mail.com',
      phone: '(13) 3322-2233'
      )
    end

    visit companies_path

    expect(page).to have_content "Reading Company 0"
    expect(page).to have_content "Reading Company 1"
    expect(page).to have_content "Reading Company 2"
    expect(page).to have_content "Reading Company 3"
    expect(page).to have_content "Reading Company 4"
  end

  scenario 'user create companies' do
    company = Company.create(
    name: "Creating Company",
    location: 'Guarujá',
    mail: 'created@mail.com',
    phone: '(13) 3322-2233'
    )
    visit new_company_path

    fill_in 'company[name]', with: company.name
    fill_in 'company[location]', with: company.location
    fill_in 'company[mail]', with: company.mail
    fill_in 'company[phone]', with: company.phone

    click_on 'submit'

    expect(page).to have_content company.name
    expect(page).to have_content company.location
    expect(page).to have_content company.mail
    expect(page).to have_content company.phone
  end

  scenario 'user update company' do
    company = Company.create(
    name: "Creating Company",
    location: 'Guarujá',
    mail: 'created@mail.com',
    phone: '(13) 3322-2233'
    )

    visit edit_company_path(company)

    # puts page.html

    fill_in 'company[name]', with: company.name
    fill_in 'company[location]', with: company.location
    fill_in 'company[mail]', with: company.mail
    fill_in 'company[phone]', with: company.phone

    click_on 'submit'

    expect(page).to have_content company.name
    expect(page).to have_content company.location
    expect(page).to have_content company.mail
    expect(page).to have_content company.phone
  end

  scenario 'user try to create an invalid company' do
    visit new_company_path

    click_on 'submit'

    expect(page).to have_content "Warning: All fields are necessary"
  end

end
