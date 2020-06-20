class Category < ApplicationRecord
	has_many :posts

	#ancestry使用
	has_ancestry
end
