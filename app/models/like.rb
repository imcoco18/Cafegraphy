class Like < ApplicationRecord

  belongs_to :user
  belongs_to :post
  #validates_uniqueness_ofによって、post_idとuser_id　の組が1組しかないようにバリデーション
  validates_uniqueness_of :post_id, scope: :user_id
end
