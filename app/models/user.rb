class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  attachment :profile_image, destroy: false
  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  #ユーザーがどの投稿にいいねをしているのか簡単に取得できるようにするため
  has_many :liked_posts, through: :likes, source: :post

  validates :name, presence: true, length: {maximum: 15, minimum: 1}
  validates :introduction, length: {maximum: 50}
end
