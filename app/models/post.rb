class Post < ApplicationRecord

  belongs_to :user
  has_many :likes, dependent: :destroy
  #投稿がどのユーザーにいいねされているのかを簡単に取得できるようにするため
  def liked_by?(user)#いいね しているかどうか
    likes.where(user_id: user.id).exists?
  end
  has_many :liked_users, through: :likes, source: :user
  has_many :post_comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags, dependent: :destroy #中間テーブル

  attachment :post_image

  #評価対象となる項目を指定
  ratyrate_rateable :shop_name

  validates :title, :post_image, :shop_name, presence: true #:category_id
  validates :title, :shop_name, length: {maximum: 25}
end
