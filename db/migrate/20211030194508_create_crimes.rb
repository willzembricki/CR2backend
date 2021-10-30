class CreateCrimes < ActiveRecord::Migration[6.1]
  def change
    create_table :crimes do |t|
      t.references :state, null: false, foreign_key: true
      t.string :crime_name
      t.integer :pop
      t.integer :asian_pop
      t.integer :hawaiian
      t.integer :black
      t.integer :american_indian
      t.integer :unknown
      t.integer :white
      t.integer :year

      t.timestamps
    end
  end
end
