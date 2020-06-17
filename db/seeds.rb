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
  user.posts.create!(
  	post_image: File.open("./app/assets/images/cafe2.jpg"),
    title: 'good tea',
    shop_name: 'coffeeshop'
  )
end

Tag.create!([
  { name: 'WiFi' },
  { name: '電源' },
  { name: '喫煙' },
  { name: '禁煙' },
  { name: '静か' },
  { name: '子供OK' },
  { name: 'お酒' }
])

