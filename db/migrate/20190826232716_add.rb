class Add < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :firstName, :string
    add_column :users, :lastName, :string
    add_column :users, :type, :string
    add_column :users, :dob, :date
    add_column :users, :gravatar, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
  end
end
