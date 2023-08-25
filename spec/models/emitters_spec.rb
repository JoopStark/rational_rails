require "rails_helper"

RSpec.describe Emitter, type: :model do
  it {should belong_to :individual}
end