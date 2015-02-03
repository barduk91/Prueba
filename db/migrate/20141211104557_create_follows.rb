class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.belongs_to :follower
      t.string :type_following
      t.belongs_to :following
      t.string :type_follower
      t.timestamps
    end
  end
end
