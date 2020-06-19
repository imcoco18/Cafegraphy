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

Category.create!([
  { name: '大阪' },
  { name: '神戸' },
  { name: '京都' },
  { name: '名古屋' }
])




