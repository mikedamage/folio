module PagesHelper
	
	def link_to_project(text, options={})
		id = options[:id] if options.has_key?(:id)
		%{<a href="/projects/#{id}">#{text}</a>}
	end
	
	def link_to_category(text, options={})
		id = options[:id] if options.has_key?(:id)
		%{<a href="/categories/#{id}">#{text}</a>}
	end
	
	def link_to_page
	end
	
end
