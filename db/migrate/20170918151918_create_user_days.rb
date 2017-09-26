class CreateUserDays < ActiveRecord::Migration[5.0]
  def change
    create_table :user_days do |t|
      t.integer :user_id, null: false
      t.integer :day_id, null: false
      t.integer :amount, null: false, default: 0

      t.timestamps
    end
  end
end
