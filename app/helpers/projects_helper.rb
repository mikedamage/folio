module ProjectsHelper
	# TODO: Figure out how to make this category_list helper method work. Need to learn more about helpers.
	def category_list
		list = select_tag('project[category_id]', @categories.collect { |c| [c.name, c.id] }, { :include_blank => false})
		return list
	end
	
end
