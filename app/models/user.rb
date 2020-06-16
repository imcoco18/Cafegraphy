class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ratyrate_rater
  
  attachment :profile_image, destroy: false

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy

 #いいね機能
  has_many :likes, dependent: :destroy
   #ユーザーがどの投稿にいいねをしているのか簡単に取得できるようにするため
  has_many :liked_posts, through: :likes, source: :post



 #フォロー機能
  has_many :relationships
    #followingクラス（モデル）を架空で作り出した、中間テーブルはrelationships設定、relationshipsテーブルのfollow_idを参考にfollowingsモデルにアクセスさせる。
  has_many :followings, through: :relationships, source: :follow
    #has_many :relaitonshipsの「逆方向」の意味で命名、foreign_key: :'follow_id'はrelaitonshipsテーブルにアクセス時、follow_idを入口として来て下さいという事。
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "follow_id"
    #has_many :followersもこのタイミングで命名、中間テーブルはreverses_of_relationshipと設定、出口はuser_id、userテーブルから自分をフォロしてるuserをとってくると設定。
  has_many :followers, through: :reverse_of_relationships, source: :user
  #foregin_key = 入口
  #source = 出口
    #フォローできるユーザーを取り出すに記述
  has_many :follow_relationships, foreign_key: "user_id", class_name: "Relationship", dependent: :destroy

  has_many :follows, through: :follow_relationships

  def follow(other_user)
    #自分をフォローしていないか
    unless self == other_user
        #既にフォローされている場合にフォローが重複して保存されることがなくなる
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end
  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
     #もしrelationship が存在すれば destroyする
    relationship.destroy if relationship
  end
  def following?(other_user)
     #other_user が含まれていないかを確認
    self.followings.include?(other_user)
  end

def self.create_all_ranks
  User.find(Relationship.group(:follow_id).order("count(follow_id) desc").limit(5).pluck(:follow_id))
end


  validates :name, presence: true, length: {maximum: 15, minimum: 1}
  validates :introduction, length: {maximum: 50}
end
