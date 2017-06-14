require 'rails_helper'

describe 'User deletes an existing category' do
  scenario 'a user can delete a category' do
    category = Category.create(title: 'DevOps')

    visit categories_path
    within(".category_#{category.id}") do
      click_link 'delete'
    end

    expect(page).to have_content('DevOps was successfully deleted')
  end
end
