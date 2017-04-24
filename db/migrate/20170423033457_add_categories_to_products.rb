class AddCategoriesToProducts < ActiveRecord::Migration
  def change
    add_column :products, :categories, :string
    add_index  :products, :categories
  end
end
