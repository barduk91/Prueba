class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :description
      t.string :cif
      t.string :padrino_code
      t.string :own_padrino_code
      t.string :role
      t.boolean :verified
      t.string :registrtion_date
      t.string :deactivationdate
      t.string :sector
      t.string :company_type
      t.string :customer_support_email
      t.string :own_padrino_code
      t.string :padrino_code
      t.string :secundary_email
      t.string :phone_number
      t.string :customer_support_phone_number
      t.string :main_contact_name
      t.string :website
      t.string :street_type
      t.string :street
      t.string :number
      t.string :block
      t.string :main_entry
      t.string :floor
      t.string :additional_information
      t.string :poste_code
      t.timestamps
    end
  end
end
