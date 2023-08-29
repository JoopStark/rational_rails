# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
anne = Individual.create!(email_display: "AnneSmith12@aol.com", name: "Anne Smith", age: 31, improve:true)
blair = Individual.create!(email_display: "blair@aol.com", name: "Blair", age: 32, improve:true)
connor = Individual.create!(email_display: "Connor@aol.com", name: "Connor", age: 33, improve:false)
vehicle = connor.emitters.create!(appliance: "Yukon", co2e_per_hour: 100, hours_per_day: 3, use: true)
hot_water = connor.emitters.create!(appliance: "On Demand Water Heater", co2e_per_hour: 12, hours_per_day: 0.5, use: true)
old_hot_water = anne.emitters.create!(appliance: "On Demand Water Heater", co2e_per_hour: 12, hours_per_day: 0.5, use: false)