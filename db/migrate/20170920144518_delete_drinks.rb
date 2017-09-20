class DeleteDrinks < ActiveRecord::Migration[5.0]
  def change
    drop_table :drinks
  end
end
