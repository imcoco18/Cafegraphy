# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |n|
    Customer.create!(
      email: "test#{n + 1}@test.com",
      name: "name#{n + 1}",
      password: "123456",
      profile_image: open("./app/assets/images/Cafegraphy.jpg")
    )
end

10.times do |n|
	Post.create!(
	    title: "title#{n + 1}",
	    post_image:  open("./app/assets/images/sample1.jpg"),
	    shop_name: "cafe#{n + 1}"
	  )
end