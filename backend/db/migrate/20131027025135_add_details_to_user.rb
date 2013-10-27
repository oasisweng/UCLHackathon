class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :phonenumber, :string
    add_column :users, :age, :integer
    add_column :users, :gender, :string
    add_column :users, :university, :string
    add_column :users, :course, :string
    add_column :users, :ethnics, :string
    add_column :users, :nationality, :string
    add_column :users, :interest, :string
    add_column :users, :hates, :string
    add_column :users, :smoking, :boolean
    add_column :users, :religion, :string
    add_column :users, :paypal, :string
    add_column :users, :hasPaidDeposit, :boolean
    add_column :users, :Rid, :integer
    add_column :users, :PairdUser, :integer
  end
end
