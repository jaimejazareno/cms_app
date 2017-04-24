class ChangeAgainFromProducts < ActiveRecord::Migration
  def change
  	change_table :products do |t|
      t.change :categories, :string
    end
  end
end
