class Admin::ProjectsController < ApplicationController

	layout "main"

	def index
		@count = Project.count
		if @count > 0
			@projects = Project.find(:all)
		else
			redirect_to :action => "new"
			flash[:notice] = "No projects found, please create one."
		end
	end
	
	def show
		@project = Project.find(params[:id])
		@tags = Project.tag_list
	end
	
	def new
		@project = Project.new
	end
	
	def edit
		@project = Project.find(params[:id])
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
	end
end
