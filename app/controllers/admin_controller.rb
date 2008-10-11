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
	end

  def projects
		@projects = Project.find(:all)
  end

	def category
		@category = Category.find(params[:id])
		@projects = Project.find(:all, :conditions => { :category_id => @category.id })
	end
	
  def categories
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

end
