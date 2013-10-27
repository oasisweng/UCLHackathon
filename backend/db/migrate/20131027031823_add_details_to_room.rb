class AddDetailsToRoom < ActiveRecord::Migration
  def change
    add_column :rooms, :postal, :string
    add_column :rooms, :address, :string
    add_column :rooms, :tenants, :integer
    add_column :rooms, :smoking, :boolean
    add_column :rooms, :pet, :boolean
    add_column :rooms, :minimal, :string
    add_column :rooms, :billsIncluded, :boolean
    add_column :rooms, :Price, :integer
    add_column :rooms, :deposit, :integer
    add_column :rooms, :rented, :boolean
  end
end
