class Category < ActiveRecord::Base
  before_destroy :ensure_not_referenced_by_any_products

	has_many :products

	validates :name, presence: true

	# このカテゴリを参照している品目がないことを確認する
  def ensure_not_referenced_by_any_products
  	if products.empty?
  		return true
  	else
      # TODO　うまく画面に表示されない
  		errors.add(:base, '商品が存在します')
  		return false
  	end
  end
end
