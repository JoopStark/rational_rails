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

  it "links to the individual index on emitter index" do
    anne = Individual.create!(email_display: "AnneSmith12@aol.com", name: "Anne Smith", age: 31, improve:true)
    airconditioner = anne.emitters.create!(appliance: "Air conditioner", co2e_per_hour: 100, hours_per_day: 3, use: true)
    camry = anne.emitters.create!(appliance: "Camry", co2e_per_hour: 12, hours_per_day: 0.5, use: true)
    buick = anne.emitters.create!(appliance: "Buick", co2e_per_hour: 12, hours_per_day: 0.5, use: true)

    visit "/individuals/#{anne.id}/emitters"

    # save_and_open_page
    expect("Buick").to appear_before("Camry")
    expect("Air conditioner").to appear_before("Camry")
  end

  it "links to the individual emitter index on emitter edit" do
    anne = Individual.create!(email_display: "AnneSmith12@aol.com", name: "Anne Smith", age: 31, improve:true)
    airconditioner = anne.emitters.create!(appliance: "Air conditioner", co2e_per_hour: 100, hours_per_day: 3, use: true)
    camry = anne.emitters.create!(appliance: "Camry", co2e_per_hour: 12, hours_per_day: 0.5, use: true)
    buick = anne.emitters.create!(appliance: "Buick", co2e_per_hour: 12, hours_per_day: 0.5, use: true)

    visit "/individuals/#{anne.id}/emitters"

    click_on "Edit #{camry.appliance}"

    expect(current_path).to eq("/emitters/#{camry.id}/edit")
  end

  it "to be able to only show emitters by a certain condition" do
    anne = Individual.create!(email_display: "AnneSmith12@aol.com", name: "Anne Smith", age: 31, improve:true)
    airconditioner = anne.emitters.create!(appliance: "Air conditioner", co2e_per_hour: 100, hours_per_day: 3, use: true)
    buick = anne.emitters.create!(appliance: "Buick", co2e_per_hour: 70, hours_per_day: 0.5, use: true)
    camry = anne.emitters.create!(appliance: "Camry plugin", co2e_per_hour: 12, hours_per_day: 0.5, use: true)

    visit "/individuals/#{anne.id}/emitters"

    expect(page).to have_content(buick.appliance)
    expect(page).to have_content(camry.appliance)

    fill_in("Only show emitters over", with: 50)
    click_button ("Only return records with more than value of CO2e/hour")
    save_and_open_page
    expect(page).to_not have_content(camry.appliance)
    expect(page).to have_content(buick.appliance)
  end
end