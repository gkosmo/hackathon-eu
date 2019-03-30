# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.destroy_all

Category.create!(title: "Travel within the Union")
Category.create!(title: "Work and retirement within the Union")
Category.create!(title: "Vehicles in the Union")
Category.create!(title: "Residence in another Member State")
Category.create!(title: "Education or traineeship in another Member State")
Category.create!(title: "Healthcare")
Category.create!(title: "Citizens' and family rights")
Category.create!(title: "Consumer rights")
Category.create!(title: "Protection of personnal data")
Category.create!(title: "Starting, running and closing a business")
Category.create!(title: "Employees")
Category.create!(title: "Taxes")
Category.create!(title: "Goods")
Category.create!(title: "Services")
Category.create!(title: "Funding a business")
Category.create!(title: "Public contracts")
Category.create!(title: "Health and safety at work")





