class CreateDays < ActiveRecord::Migration[5.0]
  def change
    create_table :days do |t|
      t.datetime :date, null: false
      t.timestamps
    end
  end
end
