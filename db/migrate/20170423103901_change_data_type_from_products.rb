class ChangeDataTypeFromProducts < ActiveRecord::Migration
  def change
  	change_table :products do |t|
      t.change :categories, :integer
    end
  end
end
