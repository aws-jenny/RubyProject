class UsersController < ApplicationController

	before_action :redirect_unless_admin

	def index
		@users = User.all
	end

  def show
	@user = User.find(params[:id])

	passed_certs = UserCertificateRecord.where(user_id: params[:id])
	@certificates = Certificate.all
	p_certs = []
	passed_certs.each_with_index do |cert, index|
		p_certs[index] = cert.certificate
	end
	@certificates = @certificates - p_certs
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
  	params.require(:user).permit( :first_name, :middle_name, :last_name, :email, :business_unit_id, :isAdmin)
  end

end
