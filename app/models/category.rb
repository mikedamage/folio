class Category < ActiveRecord::Base
	has_many :projects
	
	def self.find_projects(id)
		Project.find(:all, :conditions => { :category_id => id })
	end
	
end
