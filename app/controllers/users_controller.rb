class UsersController < ApplicationController
	layout "admin"
	
  # render new.rhtml
  def new
    @user = User.new
		@title = "New User"
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_user = @user # !! now logged in
      redirect_back_or_default('/admin')
      flash_success "New user #{@user.login} created!"
    else
    	flash_failure "Couldn't set up that account"
      render :action => 'new'
    end
  end
end
