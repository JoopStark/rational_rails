require "rails_helper"

RSpec.describe Individual, type: :model do
  it {should have_many :emitters}
end