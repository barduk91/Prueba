class ChangeStringForIntegerConstants < ActiveRecord::Migration
  def change

  	change_column :users, :role, :integer

  	change_column :companies, :role, :integer
  	change_column :companies, :sector, :integer
  	change_column :companies, :company_type, :integer
  end
end
