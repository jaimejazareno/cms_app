class AddDefaultToCategories < ActiveRecord::Migration
  def change
  	change_table :categories do |t|
      t.change :is_active, :boolean, default:true
    end
  end
end
