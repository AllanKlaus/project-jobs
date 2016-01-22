require 'rails_helper'

feature 'User do CRUD on categories' do
  scenario 'user read categories' do

    category = Category.create(
    name: "Reading Category"
    )

    visit category_path(category)

    expect(page).to have_content "Reading Category"
  end

  scenario 'user create categories' do
    category = Category.create(
    name: "Creating Category"
    )
    visit new_category_path

    fill_in 'category[name]', with: category.name

    click_on 'submit'

    expect(page).to have_content category.name
  end

  scenario 'user update category' do
    category = Category.create(
    name: "Creating Category"
    )

    visit edit_category_path(category)

    fill_in 'category[name]', with: category.name

    click_on 'submit'

    expect(page).to have_content category.name
  end

  scenario 'user try to create an invalid category' do
    visit new_category_path

    click_on 'submit'

    expect(page).to have_content "Warning: All fields are necessary"
  end

end
