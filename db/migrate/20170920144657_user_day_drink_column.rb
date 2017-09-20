class UserDayDrinkColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :user_days, :ammount, :integer, null: false, default: 0
    # ammount in cups
  end
end
