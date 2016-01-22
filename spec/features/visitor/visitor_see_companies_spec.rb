require 'rails_helper'

feature 'Visitor see companies' do
  scenario 'On home' do
    5.times do |number|
      create_company(number)
    end

    visit root_path

    5.times do |number|
      expect(page).to have_content "Creating Company #{number}"
    end
  end

  scenario 'On companies page' do
    5.times do |number|
      create_company(number)
    end

    visit companies_path

    5.times do |number|
      expect(page).to have_content "Creating Company #{number}"
    end
  end

  scenario 'see company and job on company page' do
    company = create_company(5)
    job = create_job(company, nil, 10)

    visit company_path(company)

    expect(page).to have_content company.name
    expect(page).to have_content company.location
    expect(page).to have_content company.mail
    expect(page).to have_content company.phone

    expect(page).to have_content job.title
    expect(page).to have_content job.company.name
    expect(page).to have_content job.location
  end

end
