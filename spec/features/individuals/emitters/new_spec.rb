require "rails_helper"

RSpec.describe "individual's emitters page" do
  it "links to the individual's emitters create page" do
    anne = Individual.create!(email_display: "AnneSmith12@aol.com", name: "Anne Smith", age: 31, improve:true)

    visit "/individuals/#{anne.id}/emitters/"

    click_link "Add an emitter for #{anne.name}"
    save_and_open_page
    expect(current_path).to eq("/individuals/#{anne.id}/emitters/new")
  end



end

