class CreateEmitter < ActiveRecord::Migration[7.0]
  def change
    create_table :emitters do |t|
      t.string :appliance
      t.float :co2e_per_hour
      t.float :hours_per_day
      t.boolean :use

      t.timestamps
    end
  end
end
