require "rails_helper"

RSpec.describe "Edit Emitters Page" do
  it "links from a emitter show page to edit page" do
    anne = Individual.create!(email_display: "AnneSmith12@aol.com", name: "Anne Smith", age: 31, improve:true)
    vehicle = anne.emitters.create!(appliance: "Yukon", co2e_per_hour: 100.1, hours_per_day: 3.2, use: true)
    hot_water = anne.emitters.create!(appliance: "On Demand Water Heater", co2e_per_hour: 12, hours_per_day: 0.5, use: true)

    visit "/emitters/#{vehicle.id}"

    click_button "Edit #{vehicle.appliance}"
    save_and_open_page
    expect(current_path).to eq("/emitters/#{vehicle.id}/edit")
  end
end