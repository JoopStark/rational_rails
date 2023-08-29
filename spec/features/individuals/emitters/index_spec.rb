require "rails_helper"

RSpec.describe "Individual's emitters index" do
  it "shoes all the Individual's emitters" do
    anne = Individual.create!(email_display: "AnneSmith12@aol.com", name: "Anne Smith", age: 31, improve:true)
    vehicle = anne.emitters.create!(appliance: "Yukon", co2e_per_hour: 100, hours_per_day: 3, use: true)
    hot_water = anne.emitters.create!(appliance: "On Demand Water Heater", co2e_per_hour: 12, hours_per_day: 0.5, use: true)

    visit "/individuals/#{anne.id}/emitters"
    # save_and_open_page
    expect(page).to have_content(vehicle.appliance)
    expect(page).to have_content(hot_water.appliance)
  end

  it "links to the individual index on emitter index" do
    anne = Individual.create!(email_display: "AnneSmith12@aol.com", name: "Anne Smith", age: 31, improve:true)
    vehicle = anne.emitters.create!(appliance: "Yukon", co2e_per_hour: 100, hours_per_day: 3, use: true)
    hot_water = anne.emitters.create!(appliance: "On Demand Water Heater", co2e_per_hour: 12, hours_per_day: 0.5, use: true)

    visit "/individuals/#{anne.id}/emitters"
    click_on "All Individuals"

    expect(current_path).to eq("/individuals")
  end

  it "links to the individual index on emitter index" do
    anne = Individual.create!(email_display: "AnneSmith12@aol.com", name: "Anne Smith", age: 31, improve:true)
    vehicle = anne.emitters.create!(appliance: "Yukon", co2e_per_hour: 100, hours_per_day: 3, use: true)
    hot_water = anne.emitters.create!(appliance: "On Demand Water Heater", co2e_per_hour: 12, hours_per_day: 0.5, use: true)

    visit "/individuals/#{anne.id}/emitters"
    click_on "All Emitters"

    # save_and_open_page
    expect(current_path).to eq("/emitters")
  end
end