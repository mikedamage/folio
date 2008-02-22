class Admin::ClientsController < ApplicationController

	layout "admin"

	def index
		@count = Client.count
		if @count > 0
			@clients = Client.find(:all)
			@projects = Project.find(:all)
		else
			redirect_to :action => "new"
			flash[:notice] = "No clients found, please create one."
		end
	end
	
	def show
		@client = Client.find(params[:id])
		@projects = Project.find(:all, :conditions => { :client_id => @client.id })
		@project_count = Project.count(:conditions => { :client_id => @client.id })
	end
	
	def new
		@client = Client.new
	end
	
	def edit
		@client = Client.find(params[:id])
	end
	
	def create
		@client = Client.new(params[:client])
		
		if @client.save
			flash[:notice] = "Client created!"
			redirect_to :action => "index"
		else
			render :action => "new"
		end
	end
	
	def update
		@client = Client.find(params[:id])
		
		if @client.update_attributes(params[:client])
			flash[:notice] = "Client info updated"
			redirect_to :action => "index"
		else
			render :action => "edit"
		end
	end
	
	def destroy
		# Remember to use :method => "DELETE" when linking to this action
		@client = Client.find(params[:id])
		@client.destroy
	end
	
end
