class Client < ActiveRecord::Base
	has_many :projects
	
	def self.find_projects(id)
		Project.find(:all, :conditions => { :client_id => id })
	end
		
end
