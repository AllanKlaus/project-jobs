require 'rails_helper'

feature 'User access blocked categorys options' do
  scenario 'user unlogged access new category' do
    create_category
    visit new_category_path

    expect(page).to have_content "Log in"
  end

  scenario 'user unlogged access update category' do
    category = create_category

    visit edit_category_path(category)

    expect(page).to have_content "Log in"
  end
end
