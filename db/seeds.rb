Company.destroy_all
Job.destroy_all
Category.destroy_all

COMPANIES = ["ESPN", "Aetna", "United Airlines", "Denver Public Schools", "Shopify", "Starbucks", "Pivotal Labs", "Captain U"]
JOBS = ["Engineering", "Development", "Dev Ops", "Quality Assurance", "Teacher", "Product Manager", "Consultant", "Community Manager"]
CITIES = ["Seattle", "Denver", "Portland", "Indianapolis", "Madison", "Orlando", "San Diego", "Austin", "Las Vegas", "Little Rock", "Boise", "Eugene", "Oakland"]

10.times do
  Category.create!(title: Faker::Job.unique.field)
end

puts "done with categories"

COMPANIES.each do |name|
  company = Company.create!(name: name)
  puts "Created #{company.name}"
  10.times do |num|
    job = company.jobs.create!(title: JOBS.sample, description: "What a great position!", level_of_interest: num + rand(100), city: CITIES.sample, category_id: rand(1..10))
    10.times do
      job.comments.append(Comment.create(title: Faker::Hipster.sentence(3), body: Faker::Hipster.paragraph))
    end
    puts "  Created #{company.jobs[num].title} with 10 comments"
  end
end


