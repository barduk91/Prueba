class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :padrino_code
      t.string :own_padrino_code
      t.string :password
      t.string :deactivationdate
      t.string :role
      t.string :registrtion_date
      t.timestamps
    end
  end
end
