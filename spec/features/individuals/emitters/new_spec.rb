require "rails_helper"

RSpec.describe "individual's emitters page" do
  it "links to the individual's emitters create page" do
    anne = Individual.create!(email_display: "AnneSmith12@aol.com", name: "Anne Smith", age: 31, improve:true)

    visit "/individuals/#{anne.id}/emitters/"

    click_link "Add an emitter for #{anne.name}"
    # save_and_open_page
    expect(current_path).to eq("/individuals/#{anne.id}/emitters/new")
  end

  it "can create a new emitter attached to an individual" do
    anne = Individual.create!(email_display: "AnneSmith12@aol.com", name: "Anne Smith", age: 31, improve:true)

    visit "/individuals/#{anne.id}/emitters/new"

    fill_in("Name or Type", with: "Gas Stove")
    fill_in("CO2e/hour", with: 2.1 )
    fill_in("Hours/day", with: 3.3 )
    # check("Still being used?")
    click_button ('Add Emitter')
    
    
    new_emitter_id = anne.emitters.last.id
    expect(current_path).to eq("/individuals/#{anne.id}/emitters")
    # save_and_open_page
    expect(page).to have_content("Gas Stove")
    expect(page).to have_content(2.1)
    expect(page).to have_content(3.3)
    expect(page).to have_content(false)
  end
end

