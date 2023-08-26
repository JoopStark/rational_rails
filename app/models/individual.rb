class Individual < ApplicationRecord
  has_many :emitters

  def newest_on_top
    binding.pry
  end

end