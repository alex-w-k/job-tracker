require 'rails_helper'

describe 'User can add a new contact' do
  scenario 'a user can add a new contact to an existing company' do
    company = Company.create(name: 'Test')
    visit company_path(company)

    within('.add-contact') do
      click_on 'add'
    end

    expect(current_path).to eq(new_company_contact_path(company))
    fill_in "contact[full_name]", with: 'Alex Koch'
    fill_in 'contact[email]', with: 'ceo@awesome.co'
    fill_in 'contact[position]', with: 'ceo'
    click_on 'Submit'

    expect(current_path).to eq(company_jobs_path(company))
    within('.contacts') do
      expect(page).to have_content('Alex Koch')
      expect(page).to have_content('ceo')
      expect(page).to have_content('ceo@awesome.co')
    end
  end
end
