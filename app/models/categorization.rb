class Categorization < ActiveRecord::Base

	belongs_to :product
	belongs_to :category

	validate :category_id, presence:true
	
end
