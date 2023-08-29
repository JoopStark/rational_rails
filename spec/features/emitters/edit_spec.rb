require "rails_helper"

RSpec.describe "Edit Emitters Page" do
  it "links from a emitter show page to edit page" do
    anne = Individual.create!(email_display: "AnneSmith12@aol.com", name: "Anne Smith", age: 31, improve:true)
    vehicle = anne.emitters.create!(appliance: "Yukon", co2e_per_hour: 100.1, hours_per_day: 3.2, use: true)
    hot_water = anne.emitters.create!(appliance: "On Demand Water Heater", co2e_per_hour: 12, hours_per_day: 0.5, use: true)
    
    visit "/emitters/#{vehicle.id}"
    
    click_button "Edit #{vehicle.appliance}"
    # save_and_open_page
    expect(current_path).to eq("/emitters/#{vehicle.id}/edit")
  end
  
  it "can edit individual's traits" do
    anne = Individual.create!(email_display: "AnneSmith12@aol.com", name: "Annie Smitt", age: 31, improve:true)
    vehicle = anne.emitters.create!(appliance: "Yukky", co2e_per_hour: 100.1, hours_per_day: 3.2, use: true)

    visit "/emitters"

    expect(page).to have_content("Yukky")

    visit "/emitters/#{vehicle.id}/edit"

    
    fill_in("Name or Type", with: "Yukon" )
    # fill_in("Age", with: 31 )
    # fill_in("Email", with: "AnneSmith12@aol.com" )
    # save_and_open_page
    # check("Improve")
    click_button "Update #{vehicle.appliance}"

    expect(current_path).to eq("/emitters")
    expect(page).to have_content("Yukon")
    expect(page).to have_content("100.1")
  end
end