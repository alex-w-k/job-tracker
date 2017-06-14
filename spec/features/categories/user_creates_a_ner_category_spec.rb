require 'rails_helper'

describe 'User creates a new category' do
  scenario 'a can create a new category' do
    visit new_category_path

    fill_in "category[title]", with: "DevOps"

    click_button "Submit"

    expect(page).to have_current_path(category_path(Category.last))
    expect(page).to have_content('DevOps')
  end

  scenario 'a user cannot create a category if name is already taken' do
    Category.create!(title: "DevOps")

    visit new_category_path
    
    fill_in "category[title]", with: "DevOps"

    expect(page).to have_current_path(new_category_path)
    expect(page).to have_content("Title has already been taken")
  end
end
