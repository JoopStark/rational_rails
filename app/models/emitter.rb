class Emitter < ApplicationRecord
  belongs_to :individual
  
  def self.alphabetical_name
    order(:appliance)
  end

end