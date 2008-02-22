class Admin::ProjectsController < ApplicationController
	caches_page :new
	
	layout "admin"

	def index
		@count = Project.count
		@in_rotation = Project.count(:all, :conditions => { :in_rotation => true })
		if @count > 0
			@projects = Project.find(:all)
			@tags = Project.tag_counts
		else
			redirect_to :action => "new"
			flash[:notice] = "No projects found, please create one."
		end
	end
	
	def show
		@project = Project.find(params[:id])
		@tags = @project.tag_list
		@description = RedCloth.new(@project.description).to_html
	end
	
	def new
		@project = Project.new
		@categories = Category.find(:all)
		@clients = Client.find(:all)
	end
	
	def edit
		@project = Project.find(params[:id])
		@categories = Category.find(:all)
		@clients = Client.find(:all)
	end
	
	def create
		@project = Project.new(params[:project])
		
		if @project.save
			flash[:notice] = "Project created!"
			redirect_to :action => "index"
		else
			render :action => "new"
		end
	end
	
	def update
		@project = Project.find(params[:id])
		
		if @project.update_attributes(params[:project])
			flash[:notice] = "Project info updated"
			redirect_to :action => "index"
		else
			render :action => "edit"
		end
	end
	
	def destroy
		# Remember to use :method => "DELETE" when linking to this action
		@project = Project.find(params[:id])
		@project.destroy
		redirect_to :action => 'index'
	end
end
