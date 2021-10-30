class CreateArrests < ActiveRecord::Migration[6.1]
  def change
    create_table :arrests do |t|
      t.references :state, null: false, foreign_key: true
      t.references :crime, null: false, foreign_key: true

      t.timestamps
    end
  end
end
