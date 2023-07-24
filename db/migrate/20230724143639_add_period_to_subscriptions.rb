class AddPeriodToSubscriptions < ActiveRecord::Migration[7.0]
  def change
    add_column :subscriptions, :period, :integer
  end
end
