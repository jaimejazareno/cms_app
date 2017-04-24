class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.boolean :is_active, default: true

      t.timestamps
    end

    add_index :categories, [:name,:is_active]

  end
end
