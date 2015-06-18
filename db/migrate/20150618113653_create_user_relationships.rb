class CreateUserRelationships < ActiveRecord::Migration
  def change
    create_table :user_relationships do |t|
      t.integer :leader_id, index: true
      t.integer :follower_id, index: true
      t.timestamps null: false
    end
  end
end
