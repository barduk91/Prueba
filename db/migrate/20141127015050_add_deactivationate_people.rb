class AddDeactivationatePeople < ActiveRecord::Migration
  def change
  	add_column :people, :deactivationdate, :string
  end
end
