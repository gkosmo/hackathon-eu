# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"
Follow.destroy_all

Comment.destroy_all
Problem.destroy_all
Category.destroy_all
travel = Category.create!(title: "Travel within the Union")
work = Category.create!(title: "Work and retirement within the Union")
vehicles = Category.create!(title: "Vehicles in the Union")
other_state = Category.create!(title: "Residence in another Member State")
education = Category.create!(title: "Education or traineeship in another Member State")
health = Category.create!(title: "Healthcare")
family = Category.create!(title: "Citizens' and family rights")
consumer = Category.create!(title: "Consumer rights")
Category.create!(title: "Protection of personnal data")
Category.create!(title: "Starting, running and closing a business")
Category.create!(title: "Employees")
Category.create!(title: "Taxes")
Category.create!(title: "Goods")
Category.create!(title: "Services")
Category.create!(title: "Funding a business")
Category.create!(title: "Public contracts")
Category.create!(title: "Health and safety at work")
users =[ User.create(email: 'a@a.com', password: "123123") ] 
users << User.create(email: 'b@a.com', password: "123123")
users << User.create(email: 'c@a.com', password: "123123")
users << User.create(email: 'd@a.com', password: "123123")
users << User.create(email: 'e@a.com', password: "123123")

p problem_1 = Problem.create!(title: "Can I use my driving licence as an ID document at the border?", description: "I'm Portuguese and am going to Cyprus this summer for holidays. I'm taking the ferry with my car on a cruise and they accepted my driving licence. Is that enough ? ", category: travel)
p problem_1.comments.create!(description: "Is it with the MedTour Cruise ? I'm French and I have the same problem", user: users.sample )
require 'open-uri'
require 'nokogiri'


url = 'https://europa.eu/youreurope/citizens/travel/entry-exit/non-eu-family/faq/index_en.htm'

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)
html_doc.search('.question-list li').each do |element|
   question =  element.search('.question')[0].text.strip
   answer =  element.search('.answer')[0].text.strip
    p question
    p problem_1 = Problem.create!(title: question.split('.').last , description: question, category: travel)
    p problem_1.comments.create!(description: answer, user: users.sample )
    
end

url = "https://europa.eu/youreurope/citizens/travel/transport-disability/reduced-mobility/faq/index_en.htm"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)
html_doc.search('.question-list li').each do |element|
   question =  element.search('.question')[0].text.strip
   answer =  element.search('.answer')[0].text.strip
    p question
    p problem_1 = Problem.create!(title: question.split('.').last , description: question, category: travel)
    p problem_1.comments.create!(description: answer, user: users.sample )
    problem_1.tag_list.add(['transport disability', 'reduced mobility'])
    problem_1.save
end


url = "https://europa.eu/youreurope/citizens/work/professional-qualifications/regulated-professions/faq/index_en.htm"
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)
html_doc.search('.question-list li').each do |element|
   question =  element.search('.question')[0].text.strip
   answer =  element.search('.answer')[0].text.strip
    p question
    p problem_1 = Problem.create!(title: question.split('.').last , description: question, category: work)
    p problem_1.comments.create!(description: answer, user: users.sample )
    problem_1.tag_list.add(['professional qualifation', 'regulated professions', 'employment', "work"])
    problem_1.save
end

url = "https://europa.eu/youreurope/citizens/work/retire-abroad/state-pensions-abroad/faq/index_en.htm"
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)
html_doc.search('.question-list li').each do |element|
   question =  element.search('.question')[0].text.strip
   answer =  element.search('.answer')[0].text.strip
    p question
    p problem_1 = Problem.create!(title: question.split('.').last , description: question, category: work)
    p problem_1.comments.create!(description: answer, user: users.sample )
    problem_1.tag_list.add(['professional qualifation', 'regulated professions', 'employment', "work"])
    problem_1.save
end

url ="https://europa.eu/youreurope/citizens/vehicles/cars/buying-a-car-abroad/faq/index_en.htm"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)
html_doc.search('.question-list li').each do |element|
   question =  element.search('.question')[0].text.strip
   answer =  element.search('.answer')[0].text.strip
    p question
    p problem_1 = Problem.create!(title: question.split('.').last , description: question, category: vehicles)
    p problem_1.comments.create!(description: answer, user: users.sample )
    problem_1.tag_list.add(['car', 'buying', "leasing"])
    problem_1.save
end

# url = 'https://europa.eu/youreurope/citizens/education/university/admission-entry-conditions/faq/index_en.htm'

# html_file = open(url).read
# html_doc = Nokogiri::HTML(html_file)
# html_doc.search('.question-list li').each do |element|
#    question =  element.search('.question')[0].text.strip
#    answer =  element.search('.answer')[0].text.strip
#     p question
#     p problem_1 = Problem.create!(title: question.split('.').last , description: question, category: education)
#     p problem_1.comments.create!(description: answer, user: users.sample )
#     problem_1.tag_list.add(['admission', 'university', "school"])
#     problem_1.save
# end

url = 'https://europa.eu/youreurope/citizens/health/planned-healthcare/right-to-treatment/faq/index_en.htm'

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)
html_doc.search('.question-list li').each do |element|
   question =  element.search('.question')[0].text.strip
   answer =  element.search('.answer')[0].text.strip
    p question
    p problem_1 = Problem.create!(title: question.split('.').last , description: question, category: health)
    p problem_1.comments.create!(description: answer, user: users.sample )
    problem_1.tag_list.add(['educational records', 'medical procesure', "planned medical treatment"])
    problem_1.save
end

url = 'https://europa.eu/youreurope/citizens/health/planned-healthcare/expenses-reimbursements/faq/index_en.htm'

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)
html_doc.search('.question-list li').each do |element|
   question =  element.search('.question')[0].text.strip
   answer =  element.search('.answer')[0].text.strip
    p question
    p problem_1 = Problem.create!(title: question.split('.').last , description: question, category: health)
    p problem_1.comments.create!(description: answer, user: users.sample )
    problem_1.tag_list.add(['medical procesure', "reimbursements"])
    problem_1.save
end

url ='https://europa.eu/youreurope/citizens/family/children/parental-responsibility/faq/index_en.htm'

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)
html_doc.search('.question-list li').each do |element|
   question =  element.search('.question')[0].text.strip
   answer =  element.search('.answer')[0].text.strip
    p question
    p problem_1 = Problem.create!(title: question.split('.').last , description: question, category: family)
    p problem_1.comments.create!(description: answer, user: users.sample )
    problem_1.tag_list.add(['divorce', "parental responsibility", "custody"])
    problem_1.save
end

url = 'https://europa.eu/youreurope/citizens/consumers/shopping/contract-information/faq/index_en.htm'

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)
html_doc.search('.question-list li').each do |element|
   question =  element.search('.question')[0].text.strip
   answer =  element.search('.answer')[0].text.strip
    p question
    p problem_1 = Problem.create!(title: question.split('.').last , description: question, category: consumer)
    p problem_1.comments.create!(description: answer, user: users.sample )
    problem_1.tag_list.add(['trader', "online payment", "contract"])
    problem_1.save
end


def build_comment 
    comment = [ Faker::Books::Dune.quote, Faker::Movies::StarWars.quote,  Faker::Movies::BackToTheFuture.quote].shuffle.join(' ')

end

120.times do
    Problem.all.sample.comments.create!(description: build_comment, user: users.sample) 
end

url = "https://restcountries.eu/rest/v2/regionalbloc/eu" 
page_json =  HTTParty.get(url)
 countries = JSON.parse(page_json.body)
 countries_name_list = { }
 countries.each do  |country| 
    tag = country['name']
    problems  =  Problem.global_search(tag) 
    problems.each do |problem| 
        
        problem.tag_list.add(tag)
        problem.save!
    end
 end

 Comment.all.each do |comment|
  p  comment.update! created_at: Faker::Time.backward(200, :evening)
end