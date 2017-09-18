class CreateDrinks < ActiveRecord::Migration[5.0]
  def change
    create_table :drinks do |t|
      t.integer :user_day_id, null: false
      t.integer :ammount, null: false
      
      t.timestamps
    end
  end
end
