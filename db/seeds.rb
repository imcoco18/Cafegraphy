# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


10.times do |n|
	User.create!(
	  name: "カモノハシ#{n + 1}",
	  email: "test#{n + 1}@test.com",
	  password: "111111",
	  profile_image: File.open("./app/assets/images/Cafegraphy.jpg"),
	  introduction: "ご飯食べたいカフェいきたい"
	)
end

User.all.each do |user|
  10.times do |n|
    user.posts.create!(
    	post_image: File.open("./app/assets/images/cafe2.jpg"),
      title: "good tea#{n + 1}",
      shop_name: "coffeeshop#{n + 1}",
      category_id: 1
    )
  end
end

Tag.create!([
  { name: 'WiFiあり' },
  { name: '電源あり' },
  { name: '喫煙スペースあり' },
  { name: '全面禁煙' },
  { name: '喫煙席あり' },
  { name: '一人でもOK' },
  { name: '子供連れOK' },
  { name: 'アルコールあり' },
  { name: '駅近' },
  { name: 'テラス席あり' },
  { name: 'PCあり' },
  { name: 'クレジットカードOK' },
  { name: '電子マネーOK' }
])

osaka = Category.create(:name=>"大阪")

umeda = osaka.children.create(:name=>"梅田")
shinsaibashi = osaka.children.create(:name=>"心斎橋")
namba = osaka.children.create(:name=>"難波")

umeda.children.create([{:name=>"茶屋町"}, {:name=>"JR大阪"},{:name=>"東梅田"},{:name=>"中崎町"},{:name=>"その他"}])
shinsaibashi.children.create([{:name=>"本町"}, {:name=>"堀江"}, {:name=>"アメ村"},{:name=>"その他"}])
namba.children.create([{:name=>"道頓堀"}, {:name=>"なんば"}, {:name=>"南堀江"},{:name=>"その他"}])


hyogo = Category.create(:name=>"兵庫")

nishinomiya = hyogo.children.create(:name=>"西宮")
ashiya = hyogo.children.create(:name=>"芦屋")
kobe = hyogo.children.create(:name=>"神戸")

nishinomiya.children.create([{:name=>"西宮北口"}, {:name=>"甲子園"},{:name=>"夙川"},{:name=>"その他"}])
ashiya.children.create([{:name=>"芦屋川"}, {:name=>"阪神芦屋"}, {:name=>"JR芦屋"},{:name=>"その他"}])
kobe.children.create([{:name=>"三宮"}, {:name=>"ハーバーランド"}, {:name=>"北野"},{:name=>"灘"},{:name=>"岡本"},{:name=>"その他"}])


kyoto = Category.create(:name=>"京都")

jrkyoto = kyoto.children.create(:name=>"JR京都")
uji = kyoto.children.create(:name=>"宇治")
gion = kyoto.children.create(:name=>"祇園四条")

jrkyoto.children.create([{:name=>"五条"}, {:name=>"九条"},{:name=>"西大路"},{:name=>"その他"}])
uji.children.create([{:name=>"長岡京"}, {:name=>"伏見"}, {:name=>"京田辺"},{:name=>"その他"}])
gion.children.create([{:name=>"四条烏丸"}, {:name=>"三条"}, {:name=>"祇園"},{:name=>"南禅寺"},{:name=>"出町柳"},{:name=>"その他"}])










