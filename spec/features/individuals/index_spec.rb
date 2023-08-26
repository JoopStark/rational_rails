require "rails_helper"

RSpec.describe "individual index page", type: :feature do
  it "can see all individuals and some attributes" do
    anne = Individual.create(email_display: "AnneSmith12@aol.com", name: "Anne Smith", age: 31, improve:true)
    blair = Individual.create(email_display: "blair@aol.com", name: "Blair", age: 32, improve:true)
    connor = Individual.create(email_display: "Connor@aol.com", name: "Connor", age: 33, improve:false)
     
    visit "/individuals"

    expect(page).to have_content(anne.email_display)
    expect(page).to have_content(anne.name)
    expect(page).to have_content(blair.age)
    expect(page).to have_content(connor.improve)
  end

  it "can see on individual and some attributes" do
    anne = Individual.create(email_display: "AnneSmith12@aol.com", name: "Anne Smith", age: 31, improve:true)
    blair = Individual.create(email_display: "blair@aol.com", name: "Blair", age: 32, improve:true)
    connor = Individual.create(email_display: "Connor@aol.com", name: "Connor", age: 33, improve:false)

    visit "/individuals/#{anne.id}"

    # save_and_open_page

    expect(page).to have_content(anne.email_display)
    expect(page).to have_content(anne.name)
    expect(page).to have_content(anne.age)
    expect(page).to_not have_content(connor.name)
  end

  it "show how many emitters an individual has" do
    anne = Individual.create(email_display: "AnneSmith12@aol.com", name: "Anne Smith", age: 31, improve:true)
    blair = Individual.create(email_display: "blair@aol.com", name: "Blair", age: 32, improve:true)
    connor = Individual.create(email_display: "Connor@aol.com", name: "Connor", age: 33, improve:false)
    vehicle = anne.emitters.create!(appliance: "Yukon", co2e_per_hour: 100, hours_per_day: 3, use: true)
    hot_water = anne.emitters.create!(appliance: "On Demand Water Heater", co2e_per_hour: 12, hours_per_day: 0.5, use: true)

    visit "/individuals/#{anne.id}"

    # save_and_open_page

    expect(page).to have_content(anne.emitters.count)
    expect(page).to_not have_content(connor.name)
  end

  it "puts the newest individual on top"




end
  
