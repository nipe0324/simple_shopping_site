class Product < ActiveRecord::Base
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

#	validates :status, inclusion: { in: %w(contributed sent registered sold finished returned declined descarded) }
  validates :name, :description, :image_url, :price, :status, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 1 }

  private
  # この商品を参照している品目がないことを確認する
  def ensure_not_referenced_by_any_line_item
  	if line_items.empty?
  		return true
  	else
  		errors.add(:base, '品目が存在します')
  		return false
  	end
  end
end
