class ProjectsController < ApplicationController
	
	layout "main"
	before_filter :login_required, :except => [:index, :images, :show]
	
  def index
		@projects = Project.find(:all)
  end

  def images
		@project = Project.find(params[:id])
		@images = Image.find(:all, :conditions => { :project_id => @project.id })
  end

  def show
		@project = Project.find(params[:id])
  end

  def new
		@project = Project.new
  end

  def edit
		@project = Project.find(params[:id])
		@images = Image.find(:all, :conditions => { :project_id => @project.id })
  end

  def create
		@project = Project.new(params[:project])
		
		if @project.save
			flash_success "New project created!"
			redirect_to :controller => 'admin', :action => 'project', :id => @project.id
		else
			flash_failure "Error creating new project!"
			redirect_to :controller => 'admin', :action => 'projects'
		end
  end

  def update
		@project = Project.find(params[:id])
		
		if @project.update_attributes(params[:project])
			flash_success "Project updated!"
			redirect_to :controller => 'admin', :action => 'project', :id => @project.id
		else
			flash_failure "Error updating project!"
			redirect_to :controller => 'admin', :action => 'project', :id => @project.id
		end
  end

  def destroy
		@project = Project.find(params[:id])
		
		@project.destroy
		flash_success "Project deleted!"
		redirect_to :controller => 'admin', :action => 'projects'
  end

end
