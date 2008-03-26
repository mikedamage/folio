# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	include TagsHelper
	
	def blueprint_css_tags
		screen = stylesheet_link_tag "screen", :media => "screen, projection"
		print = stylesheet_link_tag "print", :media => "print"
		ie = "<!--[if IE]>" + stylesheet_link_tag("ie", :media => "screen") + "<![endif]-->"
		return screen + "\n" + print + "\n" + ie + "\n"
	end
	
end
