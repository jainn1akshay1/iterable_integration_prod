class AddEventNameToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :event_name, :string
  end
end
