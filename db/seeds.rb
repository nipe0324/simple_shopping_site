# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all

Product.create(
	name: 'オムライス',
	description: 'とっても美味しいオムライス',
	image_url: 'omurice.jpeg',
	price: '800',
	status: 'finished',
  note: '舌が落ちるのに注意')

Product.create(
	name: 'アヒージョ',
	description: 'オリーブオイル！',
	image_url: 'ahijo.jpeg',
	price: '600',
	status: 'finished')

Product.create(
	name: 'ラザニア',
	description: '重ねれば重ねるほど美味しい',
	image_url: 'razania.jpeg',
	price: '500',
	status: 'finished')
