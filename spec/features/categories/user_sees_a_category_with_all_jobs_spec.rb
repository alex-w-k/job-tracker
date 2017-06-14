require 'rails_helper'

describe 'User sees a specific category with all associated jobs' do
  scenario 'a user sees a list of jobs assoiciated with a category' do
    category = Category.create(title: 'DevOps')
    company1 = Company.create(name: 'Test')
    company2 = Company.create(name: 'Ibotta')
    job1 = company1.jobs.create(title: 'Devops',
                                level_of_interest: 85,
                                city: 'Denver')
    job2 = company2.jobs.create(title: 'Devops',
                                level_of_interest: 90,
                                city: 'Denver')
    category.jobs.append(job1, job2)
    visit category_path(category)

    expect(page).to have_content('Devops at Test')
    expect(page).to have_content('Devops at Ibotta')
  end
end
