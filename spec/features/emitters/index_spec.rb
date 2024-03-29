require "rails_helper"

RSpec.describe "emitters pages" do
  it "see all emitters and some attributes" do
    anne = Individual.create!(email_display: "AnneSmith12@aol.com", name: "Anne Smith", age: 31, improve:true)
    vehicle = anne.emitters.create!(appliance: "Yukon", co2e_per_hour: 100, hours_per_day: 3, use: true)
    hot_water = anne.emitters.create!(appliance: "On Demand Water Heater", co2e_per_hour: 12, hours_per_day: 0.5, use: true)

    visit "/emitters"

    # save_and_open_page

    expect(page).to have_content(vehicle.appliance)
    expect(page).to have_content(vehicle.co2e_per_hour.to_s)
    expect(page).to have_content(vehicle.hours_per_day.to_s)
    expect(page).to have_content(hot_water.use.to_s)
    expect(page).to have_content(anne.name)
  end

  it "see all emitters and some attributes" do
    anne = Individual.create!(email_display: "AnneSmith12@aol.com", name: "Anne Smith", age: 31, improve:true)
    vehicle = anne.emitters.create!(appliance: "Yukon", co2e_per_hour: 100, hours_per_day: 3, use: true)
    hot_water = anne.emitters.create!(appliance: "On Demand Water Heater", co2e_per_hour: 12, hours_per_day: 0.5, use: true)

    visit "/emitters/#{vehicle.id}"

    # save_and_open_page

    expect(page).to have_content(vehicle.appliance)
    expect(page).to have_content("CO2e per hour: " + vehicle.co2e_per_hour.to_s)
    expect(page).to have_content("Hours used a day: " + vehicle.hours_per_day.to_s)
    expect(page).to_not have_content("Still in use: " + hot_water.appliance)
    expect(page).to have_content("Belongs to: " + anne.name)
  end

  it "links to the individual index on emitter index" do
    visit "/emitters"
    click_on "All Individuals"

    expect(current_path).to eq("/individuals")
  end

  it "links to the individual index on emitter show" do
    anne = Individual.create!(email_display: "AnneSmith12@aol.com", name: "Anne Smith", age: 31, improve:true)
    vehicle = anne.emitters.create!(appliance: "Yukon", co2e_per_hour: 100, hours_per_day: 3, use: true)
    
    visit "/emitters/#{vehicle.id}"
    click_on "All Individuals"
    # save_and_open_page
    expect(current_path).to eq("/individuals")
  end

  it "links to the individual index on emitter show" do
    anne = Individual.create!(email_display: "AnneSmith12@aol.com", name: "Anne Smith", age: 31, improve:true)
    vehicle = anne.emitters.create!(appliance: "Yukon", co2e_per_hour: 100, hours_per_day: 3, use: true)
    
    visit "/emitters/#{vehicle.id}"
    click_on "All Emitters"
    # save_and_open_page
    expect(current_path).to eq("/emitters")
  end

  it "only emitters that are in use i.e. TRUE" do
    anne = Individual.create!(email_display: "AnneSmith12@aol.com", name: "Anne Smith", age: 31, improve:true)
    vehicle = anne.emitters.create!(appliance: "Yukon", co2e_per_hour: 100, hours_per_day: 3, use: true)
    hot_water = anne.emitters.create!(appliance: "On Demand Water Heater", co2e_per_hour: 12, hours_per_day: 0.5, use: true)
    old_hot_water = anne.emitters.create!(appliance: "On Demand Water Heater", co2e_per_hour: 12, hours_per_day: 0.5, use: false)

    visit "/emitters"

    # save_and_open_page

    expect(page).to have_content(vehicle.appliance)
    expect(page).to have_content(vehicle.co2e_per_hour.to_s)
    expect(page).to have_content(vehicle.hours_per_day.to_s)
    expect(page).to_not have_content(old_hot_water.use.to_s)
    expect(page).to have_content(anne.name)
  end

  it "links to the emitters to edit emitter" do
    anne = Individual.create!(email_display: "AnneSmith12@aol.com", name: "Anne Smith", age: 31, improve:true)
    airconditioner = anne.emitters.create!(appliance: "Air conditioner", co2e_per_hour: 100, hours_per_day: 3, use: true)
    camry = anne.emitters.create!(appliance: "Camry", co2e_per_hour: 12, hours_per_day: 0.5, use: true)
    buick = anne.emitters.create!(appliance: "Buick", co2e_per_hour: 12, hours_per_day: 0.5, use: true)

    visit "/emitters"

    click_on "Edit #{camry.appliance}"

    expect(current_path).to eq("/emitters/#{camry.id}/edit")
  end
end
