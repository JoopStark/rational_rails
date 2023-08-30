require "rails_helper"

RSpec.describe "individual creation" do #ask question about the order in the controller
  it "can link to a new individual creation page from individual page" do
    visit "/individuals"

    click_link("Create New Individual")
    expect(current_path).to eq('/individuals/new')
  end

  it "can create a new individual" do
    visit '/individuals/new' 

    fill_in("Name", with: "Doug" )
    fill_in("Age", with: 24 )
    fill_in("Email", with: "quailman@aol.com" )
    check("Improve")
    click_button ('Create Individual')

    new_individual_id = Individual.last.id
    expect(current_path).to eq("/individuals/#{new_individual_id}")
    expect(page).to have_content("Doug")
    expect(page).to have_content(24exi)
    expect(page).to have_content(true)
  end

end
