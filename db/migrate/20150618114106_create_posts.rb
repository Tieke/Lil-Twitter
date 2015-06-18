class CreatePosts < ActiveRecord::Migration
  def change
    t.belongs_to :user
    t.string :content
    t.timestamps null: false
  end
end
