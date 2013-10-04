class Product < ActiveRecord::Base
#	validates :status, inclusion: { in: %w(contributed sent registered sold finished returned declined descarded) }
  validates :name, :description, :image_url, :price, :status, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 1 }
end
