class UsersController < ApplicationController

	before_action :redirect_unless_admin

	def index
		@users = User.all
	end

	def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
  	if @user.update(update_user_params)
  		flash[:success] = "User updated."
    	redirect_to users_path
  	else
    	render 'edit'
  	end
  end

  def destroy
  	@user = User.find(params[:id])
		@user.destroy
		flash[:success] = "User deleted."
		redirect_to users_path
  end

  private

  def update_user_params
  	params.require(:user).permit( :first_name, :middle_name, :last_name, :email, :isAdmin)
  end

  def redirect_unless_admin
    unless current_user.try(:isAdmin?)
      flash[:alert] = "Only admins can do that."
      redirect_back fallback_location: authenticated_root_path
    end
  end


end