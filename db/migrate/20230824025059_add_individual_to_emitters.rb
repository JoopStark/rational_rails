class AddIndividualToEmitters < ActiveRecord::Migration[7.0]
  def change
    add_reference :emitters, :individual, null: false, foreign_key: true
  end
end

# rails generate migration AddIndividualToEmitters individual:references
