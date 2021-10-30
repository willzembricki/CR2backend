class CreateStates < ActiveRecord::Migration[6.1]
  def change
    create_table :states do |t|
      t.string :abbv
      t.string :name
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
