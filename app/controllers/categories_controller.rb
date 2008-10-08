class CategoriesController < ApplicationController
	
	layout "main"
	before_filter :login_required, :except => [:index, :projects, :images]
	
  def index
		@categories = Category.find(:all)
  end

  def projects
		@category = Category.find(params[:id])
		@projects = Project.find(:all, :conditions => { :category_id => @category.id })
  end

  def images
		@category = Category.find(params[:id])
		@projects = Project.find(:all, :conditions => { :category_id => @category.id })
		@images = []
		@projects.each do |project|
			Image.find(:all).each do |image|
				if image.project.id == project.id
					@images << image
				end
			end
		end
  end

  def new
		@category = Category.new
  end

  def edit
		@category = Category.find(params[:id])
  end

  def create
		@category = Category.new(params[:category])
		
		if @category.save
			flash_success "New Category Created!"
			redirect_to :controller => 'admin', :action => 'category', :id => @category.id
		else
			flash_failure "Error Creating New Category"
			redirect_to :controller => 'categories', :action => 'new'
		end
  end

  def update
		@category = Category.find(params[:id])
		
		if @category.update_attributes(params[:category])
			flash_success "Category Updated!"
			redirect_to :controller => 'admin', :action => 'category', :id => @category.id
		else
			flash_failure "Error Updating Category"
			redirect_to :controller => 'categories', :action => 'new'
		end
  end

  def destroy
		@category = Category.find(params[:id])
		@projects = Project.find(:all, :conditions => {:category_id => @category.id})
		
		if @projects
			#TODO: If a category has projects assigned to it, redirect to a page with options to either reassign or delete them
		else
			@category.destroy
			flash_success "Category Deleted"
			redirect_to :controller => 'admin', :action => 'categories'
		end
  end

end
