class Category < ActiveRecord::Base
	has_many :categorizations
	has_many :products, through: :categorizations
	validates :name, presence: true, length: { maximum: 50 }

	
end
