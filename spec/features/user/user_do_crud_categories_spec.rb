require 'rails_helper'

feature 'User do CRUD on categories' do
  scenario 'user read categories' do
    category = create_category

    visit category_path(category)

    expect(page).to have_content category.name
  end

  scenario 'user create categories' do
    login_user

    category = create_category

    visit new_category_path

    expect(page).to have_content 'Create Category'

    fill_in 'category[name]', with: category.name

    click_on 'submit'

    expect(page).to have_content category.name
  end

  scenario 'user update category' do
    login_user

    category = create_category

    visit edit_category_path(category)

    expect(page).to have_content 'Edit Category'

    fill_in 'category[name]', with: category.name

    click_on 'submit'

    expect(page).to have_content category.name
  end

  scenario 'user try to create an invalid category' do
    login_user

    visit new_category_path

    click_on 'submit'

    expect(page).to have_content "Warning: All fields are necessary"
  end

end
