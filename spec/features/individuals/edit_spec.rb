require "rails_helper"

RSpec.describe "individual edit page" do
  it "links to the individual edit page" do
    anne = Individual.create!(email_display: "AnneSmith12@aol.com", name: "Anne Smith", age: 31, improve:true)
    
    visit "/individuals"
    
    click_button "Edit #{anne.name}'s information"
    
    expect(current_path).to eq("/individuals/#{anne.id}/edit" )
  end
  
  it "can edit individual's traits" do
    anne = Individual.create!(email_display: "AnneSmith12@aol.com", name: "Annie Smitt", age: 31, improve:true)

    visit "/individuals"

    expect(page).to have_content("Annie Smitt")

    visit "/individuals/#{anne.id}/edit"

    
    # find("Annie Smitt").set("Anne Smith")
    # field = find_field 'Name'
    # field.set("Anne Smith")
    # fill_in('Name', with: "Anne Smith", fill_options: {clear: :none})
    save_and_open_page
    click_button "Update"

    expect(current_path).to eq("/individuals")
    expect(page).to have_content("Anne Smith")
    expect(page).to have_content("AnneSmith12@aol.com")
  end
end