require "rails_helper"

RSpec.describe "Destroy emitter" do
  it "can delete individuals from show page" do
    anne = Individual.create!(email_display: "AnneSmith12@aol.com", name: "Anne Smith", age: 31, improve:true)
    blair = Individual.create!(email_display: "blair@aol.com", name: "Blair", age: 32, improve:true)
    connor = Individual.create!(email_display: "Connor@aol.com", name: "Connor", age: 33, improve:false)
    vehicle = connor.emitters.create!(appliance: "Yukon", co2e_per_hour: 100, hours_per_day: 3, use: true)
    hot_water = connor.emitters.create!(appliance: "On Demand Water Heater", co2e_per_hour: 12, hours_per_day: 0.5, use: true)

    visit "/emitters"

    expect(page).to have_content(vehicle.appliance)

    visit "/emitters/#{vehicle.id}"
    
    click_button "Delete #{vehicle.appliance}"

    expect(current_path).to eq("/emitters")
    expect(page).to_not have_content(vehicle.appliance)
  end

  it "can delete individuals from index page" do
    anne = Individual.create!(email_display: "AnneSmith12@aol.com", name: "Anne Smith", age: 31, improve:true)
    blair = Individual.create!(email_display: "blair@aol.com", name: "Blair", age: 32, improve:true)
    connor = Individual.create!(email_display: "Connor@aol.com", name: "Connor", age: 33, improve:false)
    vehicle = connor.emitters.create!(appliance: "Yukon", co2e_per_hour: 100, hours_per_day: 3, use: true)
    hot_water = connor.emitters.create!(appliance: "On Demand Water Heater", co2e_per_hour: 12, hours_per_day: 0.5, use: true)

    visit "/emitters"
    
    click_button "Delete #{vehicle.appliance}"
    
    expect(current_path).to eq("/emitters")
    expect(page).to_not have_content(vehicle.appliance)
  end
end
