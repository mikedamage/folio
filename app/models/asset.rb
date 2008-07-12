class Asset < ActiveRecord::Base
	acts_as_taggable
	
	belongs_to :project	
end
