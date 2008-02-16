class Project < ActiveRecord::Base
	belongs_to :category, :client
end
