module ApplicationHelper

	def full_title(title = "")
    base_title = "Cafegraphy"
	base_title + "|" + "#{title}"
	end
end
