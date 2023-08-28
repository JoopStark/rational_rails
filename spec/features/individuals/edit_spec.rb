require "rails_helper"

RSpec.describe "individual edit page" do
  it "links to the individual edit page" do
    anne = Individual.create!(email_display: "AnneSmith12@aol.com", name: "Anne Smith", age: 31, improve:true)

    visit "/individuals"

    click_button "Edit #{anne.name}'s information"

    expect(current_path).to eq("/individuals/#{anne.id}/edit" )
  end
end