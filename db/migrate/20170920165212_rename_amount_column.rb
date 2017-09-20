class RenameAmountColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :user_days, :ammount, :amount
  end
end
