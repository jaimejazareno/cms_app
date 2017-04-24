class ChangeColumnFromProducts < ActiveRecord::Migration
  def change
  	change_table :products do |t|
      t.change :category_id, :string
    end
    rename_column :products, :category_id, :categories
  end
end
