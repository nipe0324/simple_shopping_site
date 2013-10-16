class Product < ActiveRecord::Base
  before_destroy :ensure_not_referenced_by_any_line_item

  has_many :order_details
  belongs_to :category

  validates :name, :description, :image_url, :price, :category_id, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 1 }

  private
  # この商品を参照している品目がないことを確認する
  def ensure_not_referenced_by_any_line_item
  	if order_details.empty?
  		return true
  	else
  		return false
  	end
  end
end
