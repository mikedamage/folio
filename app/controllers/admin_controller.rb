class AdminController < ApplicationController
	
	layout "admin"
	before_filter :login_required
	
  def index
		@user = current_user
		@title = "Portfolio Manager"
		# @projects = Project.find(:all)
		# 		@categories = Category.find(:all)
		# 		@images = Image.find(:all)
  end

	def project
		@project = Project.find(params[:id])
		@title = 'Projects <span class="divider">//</span> ' + @project.name
	end

  def projects
		@title = "Projects"
		@projects = Project.find(:all)
  end

	def category
		@category = Category.find(params[:id])
		@title = 'Categories <span class="divider">//</span> ' + @category.name
		@projects = Project.find(:all, :conditions => { :category_id => @category.id })
		if @category.custom_fields
			@custom_fields = @category.custom_fields.to_a
			@custom_fields.delete_at(0)
		end
	end
	
  def categories
		@title = "Categories"
		@categories = Category.find(:all)
		@projects = Project.find(:all)
		@projects_by_category = {}
		
		@categories.each do |cat|
			@projects_by_category[cat.id] = Project.find(:all, :conditions => {:category_id => cat.id})
		end
  end

	def image
		@image = Image.find(params[:id])
	end
	
	def images
		@images = Image.find(:all)
	end
	
	def settings
		@settings = Settings.find(:all)
	end

end
