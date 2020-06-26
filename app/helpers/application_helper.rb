module ApplicationHelper

	def full_title(title = "")
    base_title = "Cafegraphy"
	base_title + "|" + "#{title}"
	end

	def shape_create_time(created_at)
    created_at.strftime("%Y/%m/%d %H:%M")
  	end
end
