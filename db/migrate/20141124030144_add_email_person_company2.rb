class AddEmailPersonCompany2 < ActiveRecord::Migration
  def change
  	add_column :people, :email, :string
  	add_column :companies, :email, :string
  end
end
