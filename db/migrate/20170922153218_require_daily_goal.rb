class RequireDailyGoal < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :daily_goal, :integer, null: false, default: 10
  end
end
