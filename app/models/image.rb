class Image < ActiveRecord::Base
	belongs_to :project

	acts_as_fleximage do
		image_storage_format :jpg # Change to :png if quality is a bigger concern than storage space
		
		# preprocess_image do |image|
		# 	apply filters, resize, crop, etc.
		# end
	end
end
