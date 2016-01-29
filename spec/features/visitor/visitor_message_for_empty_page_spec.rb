require 'rails_helper'

feature 'Visitor see message on empty pages' do
  scenario 'on home' do
    visit root_path

    expect(page).to have_content 'There is no jobs'
  end

  scenario 'on jobs' do
    visit jobs_path

    expect(page).to have_content 'There is no jobs'
  end

  scenario 'on companies' do
    visit companies_path

    expect(page).to have_content 'There is no companies'
  end

  scenario 'on categories' do
    visit categories_path

    expect(page).to have_content 'There is no categories'
  end
end
