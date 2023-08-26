require "rails_helper"

RSpec.describe Individual, type: :model do
  it {should have_many :emitters}

  describe "instance methods" do 
    before :each do
      @anne = Individual.create!(email_display: "AnneSmith12@aol.com", name: "Anne Smith", age: 31, improve:true)
      @blair = Individual.create!(email_display: "blair@aol.com", name: "Blair", age: 32, improve:true)
      @connor = Individual.create!(email_display: "Connor@aol.com", name: "Connor", age: 33, improve:false)
      @vehicle = @anne.emitters.create!(appliance: "Yukon", co2e_per_hour: 100, hours_per_day: 3, use: true)
      @hot_water = @anne.emitters.create!(appliance: "On Demand Water Heater", co2e_per_hour: 12, hours_per_day: 0.5, use: true)
    end
    
    describe "newest_on_top" do
      it "it puts the most recent person on top of the list" do
        expect(Individual.newest_on_top).to eq([@connor, @blair, @anne])
      end
    end
  end

end