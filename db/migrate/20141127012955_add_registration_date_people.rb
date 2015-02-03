class AddRegistrationDatePeople < ActiveRecord::Migration
  def change
  	add_column :people, :registration_date, :string
  	change_column :people, :role, :integer
		change_column :users, :user_type, :integer


  end
end
