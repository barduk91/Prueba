class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :user_name
      t.string :padrino_code
      t.string :own_padrino_code
      t.timestamps
    end
  end
end
