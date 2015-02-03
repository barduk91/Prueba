class RenamePosteCodeForPostcode < ActiveRecord::Migration
  def change
  	rename_column :companies, :poste_code, :postcode
  end
end
