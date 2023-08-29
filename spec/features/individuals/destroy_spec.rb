require "rails_helper"

RSpec.describe "Destroy individual" do
  it "can delete individuals from index page" do
    anne = Individual.create!(email_display: "AnneSmith12@aol.com", name: "Anne Smith", age: 31, improve:true)
    blair = Individual.create!(email_display: "blair@aol.com", name: "Blair", age: 32, improve:true)
    connor = Individual.create!(email_display: "Connor@aol.com", name: "Connor", age: 33, improve:false)
    vehicle = anne.emitters.create!(appliance: "Yukon", co2e_per_hour: 100, hours_per_day: 3, use: true)
    hot_water = anne.emitters.create!(appliance: "On Demand Water Heater", co2e_per_hour: 12, hours_per_day: 0.5, use: true)

    visit "/individuals"

    expect(page).to have_conten("connor.name")

    click_button "Delete #{connor.name}"

    expect(current_path).to eq("/individuals")
    expect(page).to_no have_conten("connor.name")
  end
end


