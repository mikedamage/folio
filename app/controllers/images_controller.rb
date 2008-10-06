class ImagesController < ApplicationController
	
	layout "admin"
	before_filter :login_required, :except => [:index, :show]
	
  def index
		@images = Image.find(:all)
  end

  def show
		@image = Image.find(params[:id])
  end

  def new
		@projects = Project.find(:all)
		
		if params[:id]
			@project = Project.find(params[:id])
		end
		
		if @projects.empty?
			flash_failure "Please add some projects before uploading images!"
			redirect_to :controller => 'projects', :action => 'new'
		else
			@image = Image.new
		end
  end

  def edit
		@image = Image.find(params[:id])
  end

  def create
		@image = Image.new(params[:image])
		
		if @image.save
			flash_success "New image created"
			redirect_to :controller => 'admin', :action => 'index'
		else
			flash_failure "Error saving new image"
			redirect_to :controller => 'images', :action => 'new'
		end
  end

  def update
		@image = Image.find(params[:id])
		
		if @image.update_attributes(params[:image])
			flash_success "Image updated!"
			redirect_to :controller => 'admin', :action => 'project', :id => @image.project.id
		else
			flash_failure "Error updating image!"
			redirect_to :controller => 'admin', :action => 'image', :id => @image.id
		end
  end

  def destroy
  end

end
