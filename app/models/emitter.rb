class Emitter < ApplicationRecord
  belongs_to :individual
  
  def self.alphabetical_name
    order(:appliance)
  end

  def self.co2e_over(value)
    where("co2e_per_hour > ?", value)
  end

end