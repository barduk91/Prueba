class AssociantionUserPersonCompany < ActiveRecord::Migration
  def change
	  change_table :people do |t|
			t.belongs_to :user
	  end


	  change_table :companies do |t|
			t.belongs_to :user
	  end
  end
end
