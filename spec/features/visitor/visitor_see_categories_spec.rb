require 'rails_helper'

feature 'Visitor see categories' do
  scenario 'see categories on home' do
    5.times do |number|
      create_category(number)
    end

    visit root_path

    5.times do |number|
      expect(page).to have_content "Category #{number}"
    end
  end

  scenario 'see categories page' do
    5.times do |number|
      create_category(number)
    end

    visit categories_path

    5.times do |number|
      expect(page).to have_content "Category #{number}"
    end
  end

  scenario 'see category and job on category page' do
    category = create_category(5)
    job = create_job(nil, category, 10)

    visit category_path(category)

    expect(page).to have_content category.name

    expect(page).to have_content job.title
    expect(page).to have_content job.company.name
    expect(page).to have_content job.location
  end

end