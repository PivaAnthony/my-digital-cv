class AddDetailsToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :surname, :string, null: false
    add_column :users, :phone, :string
    add_column :users, :birthdate, :date
    add_timestamps :users, default: -> { 'CURRENT_TIMESTAMP' }
  end
end
