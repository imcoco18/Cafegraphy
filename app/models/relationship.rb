class Relationship < ApplicationRecord

  belongs_to :user
  #class_name: ‘User’ と補足設定することで、Followクラスという存在しない
  #クラスを参照することを防ぎ、User クラスであることを明示しています。
  #要は「followモデルなんて存在しないので、userモデルにbelongs_toするという事
  belongs_to :follow, class_name: "User"

  #どちらか一つでも無かった場合保存されないように
  validates :user_id, presence: true
  validates :follow_id, presence: true
end
