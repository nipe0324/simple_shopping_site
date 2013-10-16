class User < ActiveRecord::Base
	# admin can't create. Only one initialized date by seeds.rb(rake db:seed).
	# user can create. It's default.
	ROLES = %w[admin user]

	has_many :orders, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable, :confirmable, :lockable

  validates :name, :address, presence: true
end
