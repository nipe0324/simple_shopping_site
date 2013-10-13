# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
## Category
Category.delete_all

c1 = Category.create(name: '日本食')
c2 = Category.create(name: '中華')
c3 = Category.create(name: 'アジアン')
c4 = Category.create(name: '洋食')


## Product
Product.delete_all

Product.create(
	name: 'オムライス',
	description: 'とっても美味しいオムライス',
	image_url: 'omurice.jpeg',
	price: '800',
	category_id: c3.id)

Product.create(
	name: 'アヒージョ',
	description: 'オリーブオイル！',
	image_url: 'ahijo.jpeg',
	price: '600',
	category_id: c3.id)

Product.create(
	name: 'ラザニア',
	description: '重ねれば重ねるほど美味しい',
	image_url: 'razania.jpeg',
	price: '500',
	category_id: c3.id)

## User
User.delete_all

User.create(role: 'admin', name: 'admin', email: 'admin@example.com', password: 'admin12345', password_confirmation: 'admin12345', address: 'admin', confirmed_at: Time.now, confirmation_sent_at: Time.now)
User.create(role: 'user', name: 'user', email: 'user@example.com', password: 'user12345', password_confirmation: 'user12345', address: 'user', confirmed_at: Time.now, confirmation_sent_at: Time.now)

# TODO ユーザとかすべてのデータを初期化したい
