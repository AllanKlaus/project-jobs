require 'rails_helper'

feature 'Visitor see number of jobs from companies' do
  scenario 'On companies page' do
    companies = []
    counter = 5
    counter.times do |number|
      companies << create_company(name: "Company #{number}")
    end

    companies.each do |company|
      counter.times do |number|
        job = create_job(company: company, title: "Job #{number} ")
      end
      counter -= 1
    end

    visit companies_path

    5.times do |number|
      expect(page).to have_content companies[number].name
      expect(page).to have_content "Published #{companies[number].jobs.count} jobs"
    end
  end
end
