class AddDatetimeToDays < ActiveRecord::Migration[5.0]
  def change
    change_table :days do |t|
      t.datetime :date, null: false
    end
  end
end
