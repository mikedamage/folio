class Category < ActiveRecord::Base
	has_many :projects
	has_many :images, :through => :projects
end
