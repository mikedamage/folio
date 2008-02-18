class Admin::CategoriesController < ApplicationController
	
	layout "main"
	
	def index
		@count = Category.count
		if @count > 0
			@categories = Category.find(:all)
		else
			redirect_to :action => "new"
			flash[:notice] = "No categories found, please create one."
		end
	end
	
	def show
		@category = Category.find(params[:id])
		@projects = Project.find(:all, :conditions => { :category_id => @category.id })
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
			flash[:notice] = "Category created!"
			redirect_to :action => "index"
		else
			render :action => "new"
		end
	end
	
	def update
		@category = Category.find(params[:id])
		
		if @category.update_attributes(params[:category])
			flash[:notice] = "Category info updated"
			redirect_to :action => "index"
		else
			render :action => "edit"
		end
	end
	
	def destroy
		# Remember to use :method => "DELETE" when linking to this action
		@category = Category.find(params[:id])
		@category.destroy
	end
	
end
