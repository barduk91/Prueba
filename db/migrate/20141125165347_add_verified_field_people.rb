class AddVerifiedFieldPeople < ActiveRecord::Migration
  def change
  	add_column :people, :verified, :boolean
  	add_column :users, :verified, :boolean
  	add_column :people, :role, :string
  end
end
