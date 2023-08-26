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

  it "links to the individual index" do
    click_on "All individuals"

    expect(current_path).to eq("/individuls")
  end
  
  it "links to the emitter index"


end
