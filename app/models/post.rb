class Post < ApplicationRecord

  belongs_to :user
  belongs_to :category, optional: true
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
  #ratyrate_rateable :shop_name

  #ランキング表示
  def self.create_all_ranks
    #記事の番号(note_id)が同じものにグループを分け、番号の多い順に並び替え
    Post.find(Like.group(:post_id).order("count(post_id) desc").limit(4).pluck(:post_id))
  end

  validates :title, :post_image, :shop_name, :category_id, presence: true
  validates :title, :shop_name, length: {maximum: 25}
end
