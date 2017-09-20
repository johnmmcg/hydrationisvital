class AddMetricColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :metric, :string, null: false, default: 'cups'
  end
end
