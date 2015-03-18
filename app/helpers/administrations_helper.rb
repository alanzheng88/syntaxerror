module AdministrationsHelper

	def draw_user_role_columns()
		# concat(content_tag(:p, user_list))
		tags = []
		tags << content_tag(:thead) do
		 	content_tag(:tr) do
			    concat(content_tag(:th, 'Username'))
			    concat(content_tag(:th, 'Firstname'))
			    concat(content_tag(:th, 'Lastname'))
			    concat(content_tag(:th, 'Role'))

		 	end #content_tag :tr
		end #content_tag :thead
		tags.join.html_safe
	end #draw_user_role_list
end #AdministrationsHelper
