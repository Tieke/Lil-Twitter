class UpdateUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :image
      t.text :description
    end

  end
end




