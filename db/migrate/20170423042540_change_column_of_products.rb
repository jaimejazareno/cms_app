class ChangeColumnOfProducts < ActiveRecord::Migration
  def change
  	change_table :products do |t|
      t.change :categories, :integer
    end
    rename_column :products, :categories, :category_id
  end
end
