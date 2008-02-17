class Project < ActiveRecord::Base
	acts_as_taggable
	
	belongs_to :category
	belongs_to :client
end
