require "rails_helper"

RSpec.describe Emitter, type: :model do
  it {should belong_to :individual}

  it "can select data by a condition" do
    anne = Individual.create!(email_display: "AnneSmith12@aol.com", name: "Anne Smith", age: 31, improve:true)
    blair = Individual.create!(email_display: "blair@aol.com", name: "Blair", age: 32, improve:true)
    connor = Individual.create!(email_display: "Connor@aol.com", name: "Connor", age: 33, improve:false)
    vehicle = anne.emitters.create!(appliance: "Yukon", co2e_per_hour: 100, hours_per_day: 3, use: true)
    hot_tub = blair.emitters.create!(appliance: "Bubbles", co2e_per_hour: 80, hours_per_day: 3, use: true)
    stove = anne.emitters.create!(appliance: "Cooker", co2e_per_hour: 50, hours_per_day: 3, use: true)
    hot_water = anne.emitters.create!(appliance: "On Demand Water Heater", co2e_per_hour: 12, hours_per_day: 0.5, use: true)

    expect(Emitter.co2e_over(50).all).to eq([vehicle, hot_tub])
  end
end