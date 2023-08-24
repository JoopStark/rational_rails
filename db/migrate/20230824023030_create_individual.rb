class CreateIndividual < ActiveRecord::Migration[7.0]
  def change
    create_table :individuals do |t|
      t.string :email_display
      t.string :name
      t.integer :age
      t.boolean :improve

      t.timestamps
    end
  end
end
