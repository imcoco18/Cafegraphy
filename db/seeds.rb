# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# user
User.create!(
  name: "まりお",
  email: "test1@test.com",
  password: "111111",
  profile_image: File.open("./app/assets/images/user9.png"),
  introduction: "ぴーちとカフェいきたい"
)
User.create!(
  name: "るいじ",
  email: "test2@test.com",
  password: "111111",
  profile_image: File.open("./app/assets/images/user10.png"),
  introduction: "おばけとカフェいきたい"
)
User.create!(
  name: "ぴーち",
  email: "test3@test.com",
  password: "111111",
  profile_image: File.open("./app/assets/images/user2.png"),
  introduction: "みんな大好き！カフェいきたい"
)
User.create!(
  name: "くっぱ",
  email: "test4@test.com",
  password: "111111",
  profile_image: File.open("./app/assets/images/user4.png"),
  introduction: "まりおとカフェいきたい"
)
User.create!(
  name: "きのぴおときのぴこ",
  email: "test5@test.com",
  password: "111111",
  profile_image: File.open("./app/assets/images/user8.png"),
  introduction: "くりぼーも連れてカフェいきたい"
)
User.create!(
  name: "どんきーこんぐでぃでぃーこんぐ",
  email: "test6@test.com",
  password: "111111",
  profile_image: File.open("./app/assets/images/user5.png"),
  introduction: "バナナカフェいきたい"
)

# post
User.all.each do |user|
  6.times do |n|
    user.posts.create!(
      post_image: File.open("./app/assets/images/cafe#{n + 1}.jpg"),
      title: "good coffee",
      shop_name: "pukupuku coffee shop",
    )
  end

  2.times do |n|
    user.posts.create!(
      post_image: File.open("./app/assets/images/cafe#{n + 7}.jpg"),
      title: "good tea time",
      shop_name: "teresa coffee",
    )
  end

  4.times do |n|
    user.likes.create!(
      post_id: n + 2
    )
  end

  4.times do |n|
    user.relationships.create!(
      follow_id: n + 1
    )
  end
end


# 2.times do |n|
# Post.create!(
#   post_image: File.open("./app/assets/images/cafe#{n + 2}.jpg"),
#   title: "good good coffee",
#   shop_name: "teresa coffee",
# )
# end
# 3.times do |n|
# Post.create!(
#   post_image: File.open("./app/assets/images/cafe#{n + 4}.jpg"),
#   title: "luv cafe",
#   shop_name: "kinoco coffee shop",
# )
# end
# 2.times do |n|
#   Post.create!(
#     post_image: File.open("./app/assets/images/cafe#{n + 7}.jpg"),
#     title: "nice coffee",
#     shop_name: "oriental tea shop",
#   )
# end
# 2.times do |n|
#   Post.create!(
#     post_image: File.open("./app/assets/images/cafe#{n + 9}.jpg"),
#     title: "good coffee time",
#     shop_name: "nikopico coffee shop",
#   )
# end
# Post.create!(
#   post_image: File.open("./app/assets/images/cafe11.jpg"),
#   title: "tea gooood!!!!",
#   shop_name: "oriental tea shop",
# )

# like
# 5.times do |n|
#   Like.create!(
#     user_id: n + 1,
#     post_id: n + 1
#   )
# end


# relationship
# 2.times do |n|
#   Relationship.create!(
#     user_id: n + 3,
#     follow_id: n + 2
#   )
# end
# 2.times do |n|
#   Relationship.create!(
#     user_id: n + 1,
#     follow_id: n + 2
#   )
# end

# tag name
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

# tag
# 3.times do |n|
#   PostTag.create!(
#     post_id: n + 2,
#     tag_id: n + 2
#   )
# end
# 4.times do |n|
#   PostTag.create!(
#     post_id: n + 3,
#     tag_id: n + 3
#   )
# end


#エリアカテゴリー実装した場合
# osaka = Category.create(:name=>"大阪")

# umeda = osaka.children.create(:name=>"梅田")
# shinsaibashi = osaka.children.create(:name=>"心斎橋")
# namba = osaka.children.create(:name=>"難波")

# umeda.children.create([{:name=>"茶屋町"}, {:name=>"JR大阪"},{:name=>"東梅田"},{:name=>"中崎町"},{:name=>"その他"}])
# shinsaibashi.children.create([{:name=>"本町"}, {:name=>"堀江"}, {:name=>"アメ村"},{:name=>"その他"}])
# namba.children.create([{:name=>"道頓堀"}, {:name=>"なんば"}, {:name=>"南堀江"},{:name=>"その他"}])


# hyogo = Category.create(:name=>"兵庫")

# nishinomiya = hyogo.children.create(:name=>"西宮")
# ashiya = hyogo.children.create(:name=>"芦屋")
# kobe = hyogo.children.create(:name=>"神戸")

# nishinomiya.children.create([{:name=>"西宮北口"}, {:name=>"甲子園"},{:name=>"夙川"},{:name=>"その他"}])
# ashiya.children.create([{:name=>"芦屋川"}, {:name=>"阪神芦屋"}, {:name=>"JR芦屋"},{:name=>"その他"}])
# kobe.children.create([{:name=>"三宮"}, {:name=>"ハーバーランド"}, {:name=>"北野"},{:name=>"灘"},{:name=>"岡本"},{:name=>"その他"}])


# kyoto = Category.create(:name=>"京都")

# jrkyoto = kyoto.children.create(:name=>"JR京都")
# uji = kyoto.children.create(:name=>"宇治")
# gion = kyoto.children.create(:name=>"祇園四条")

# jrkyoto.children.create([{:name=>"五条"}, {:name=>"九条"},{:name=>"西大路"},{:name=>"その他"}])
# uji.children.create([{:name=>"長岡京"}, {:name=>"伏見"}, {:name=>"京田辺"},{:name=>"その他"}])
# gion.children.create([{:name=>"四条烏丸"}, {:name=>"三条"}, {:name=>"祇園"},{:name=>"南禅寺"},{:name=>"出町柳"},{:name=>"その他"}])










