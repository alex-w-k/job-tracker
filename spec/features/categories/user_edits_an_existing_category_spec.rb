require 'rails_helper'

describe 'User edits an existing category' do
  scenario 'a user can edit a category' do
    category = Category.create(title: 'DevOps')

    visit categories_path
    within(".category_#{category.id}") do
      click_on('mode_edit')
    end

    expect(current_path).to eq(edit_category_path(category))

    fill_in 'category[title]', with: 'OpsDev'

    click_button 'Submit'

    expect(page).to have_current_path(category_path(category))
    expect(page).to have_content('OpsDev')
    expect(page).to_not have_content('DevOps')
  end
end
