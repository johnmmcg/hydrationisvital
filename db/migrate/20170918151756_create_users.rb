class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.integer :daily_goal, null: false, default: 10
      t.string :metric, null: false, default: 'cups'

      t.timestamps
    end
  end
end
