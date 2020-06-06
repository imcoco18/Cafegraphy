class Post < ApplicationRecord

  belongs_to :user
  has_many :likes
  #投稿がどのユーザーにいいねされているのかを簡単に取得できるようにするため
  has_many :liked_users, through: :likes, source: :user

  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags #中間テーブル

  attachment :post_image

  validates :title, :post_image_id, :shop_name, presence: true #:category_id
  validates :title, :shop_name, length: {maximum: 25}
end
