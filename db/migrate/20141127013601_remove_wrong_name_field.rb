class RemoveWrongNameField < ActiveRecord::Migration
  def change
  	rename_column :companies, :registrtion_date, :registration_date
  	rename_column :users, :registrtion_date, :registration_date
  	remove_column :people, :registrtion_date
  end
end
