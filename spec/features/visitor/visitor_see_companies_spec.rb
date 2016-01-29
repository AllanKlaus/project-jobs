require 'rails_helper'

feature 'Visitor see companies' do
  scenario 'On home' do
    5.times do |number|
      create_company(name: "Company #{number}")
    end

    visit root_path

    5.times do |number|
      expect(page).to have_content "Company #{number}"
    end
  end

  scenario 'On companies page' do
    5.times do |number|
      create_company(name: "Company #{number}")
    end

    visit companies_path

    5.times do |number|
      expect(page).to have_content "Company #{number}"
    end
  end

  scenario 'see company and job on company page' do
    company = create_company
    job = create_job(company: company)

    visit company_path(company)

    expect(page).to have_content company.name
    expect(page).to have_content company.location
    expect(page).to have_content company.mail
    expect(page).to have_content company.phone

    expect(page).to have_content job.title
    expect(page).to have_content job.company.name
    expect(page).to have_content job.location
    expect(page).to have_content job.contract
  end

end
