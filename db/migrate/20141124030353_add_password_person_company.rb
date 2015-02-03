class AddPasswordPersonCompany < ActiveRecord::Migration
  def change
  	add_column :people, :password, :string
  	add_column :companies, :password, :string
  end
end
