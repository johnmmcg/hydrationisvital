class UserDayDrinkColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :user_days, :amount, :integer, null: false, default: 0
    # amount in cups
  end
end
