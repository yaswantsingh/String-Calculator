class CreateCalculators < ActiveRecord::Migration[7.2]
  def change
    create_table :calculators do |t|
      t.timestamps
    end
  end
end
