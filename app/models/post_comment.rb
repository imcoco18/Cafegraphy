class PostComment < ApplicationRecord

	belongs_to :user
    belongs_to :post

    validates :comment, presence: true
    validates :comment, length: {maximum: 120}
end
