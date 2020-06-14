# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# 10.times do |n|
# 	Post.create!(
# 	    title: "title#{n + 1}",
# 	    post_image: open("./app/assets/images/sample1.jpg"),
# 	    shop_name: "cafe#{n + 1}"
# 	)
# end

Tag.create!([
  { name: 'WiFi' },
  { name: '電源' },
  { name: '喫煙' },
  { name: '禁煙' },
  { name: '静か' },
  { name: '子供OK' },
  { name: 'お酒' }
])