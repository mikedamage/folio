class Project < ActiveRecord::Base
	acts_as_taggable
	# TODO: created a database column to cache the tag list for each project.
	
	belongs_to :category
	belongs_to :client
	
end
