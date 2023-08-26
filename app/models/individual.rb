class Individual < ApplicationRecord
  has_many :emitters

  def self.newest_on_top
    self.order(id: :desc)
  end

end