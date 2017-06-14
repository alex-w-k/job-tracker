require 'rails_helper'

describe 'User sees all categories' do
  scenario 'a user sees all the categories' do
    Category.create(title: 'Developer')
    Category.create(title: 'DevOps')

    visit categories_path

    expect(page).to have_content('Developer')
    expect(page).to have_content('DevOps')
  end
end
