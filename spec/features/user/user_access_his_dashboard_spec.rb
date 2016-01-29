require 'rails_helper'

feature 'User access his dashboard' do
  scenario 'successfully' do
    user = login_user
    companies  = []
    categories = []
    jobs       = []
    2.times do |number|
      companies  << create_company(name: "Company #{number}", user: user)
      categories << create_category(name: "Category #{number}")
      jobs << create_job({company: companies[number], category: categories[number]})
    end

    hidden_company  = create_company(name: "Hidden Company")
    hidden_category = create_category(name: "Hidden Category")
    hidden_job = create_job({company: hidden_company, category: hidden_category})

    visit dashboard_path

    2.times do |number|
      expect(page).to have_content companies[number].name
      expect(page).to have_content categories[number].name
      expect(page).to have_content jobs[number].title
    end

    expect(page).to_not have_content hidden_company.name
    expect(page).to_not have_content hidden_category.name
    expect(page).to_not have_content hidden_job.title
  end

  scenario 'unsuccessfully' do
    visit dashboard_path
    expect(page).to have_content "Log in"
  end
end
