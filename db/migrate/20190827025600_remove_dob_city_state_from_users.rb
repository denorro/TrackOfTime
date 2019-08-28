class RemoveDobCityStateFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :dob
    remove_column :users, :city
    remove_column :users, :state
  end
end
