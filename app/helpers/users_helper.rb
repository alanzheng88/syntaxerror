module UsersHelper

	def draw_user_role_columns(*columns)
		# concat(content_tag(:p, user_list))
		tags = []
		tags << content_tag(:thead) do
		 	content_tag(:tr) do
		 		columns.each do |column|
				    concat(content_tag(:th, column))
				end
		 	end #content_tag :tr
		end #content_tag :thead
		tags.join.html_safe
	end #draw_user_role_list
end #UsersHelper
