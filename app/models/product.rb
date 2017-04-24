class Product < ActiveRecord::Base
  attr_accessor :skippers
  has_many :categorizations, dependent: :destroy,:autosave => true
  has_many :categorys, through: :categorizations, dependent: :destroy
  validates :name, presence: true, length: { maximum:50 }
  validates :price, presence: true, numericality: true
  validates :categories, acceptance: true


end
