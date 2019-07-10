class RegistrationsController < Devise::RegistrationsController

  before_action :authenticate_user!, :redirect_unless_admin,  only: [:new, :create]
  skip_before_action :require_no_authentication

  protected

  def after_sign_up_path_for(resource)
    users_path
  end

  private
  def redirect_unless_admin
    unless current_user.try(:isAdmin?)
      flash[:error] = "Only admins can do that"
      redirect_to root_path
    end
  end

  def sign_up(resource_name, resource)
    true
  end


  private

  def sign_up_params
    password = "awsol123"
    params.require(:user).permit( :first_name, :middle_name, :last_name, :email, :isAdmin).merge(:password => password)
  end

  def account_update_params
    params.require(:user).permit( :name, 
                                  :email, 
                                  :password, 
                                  :password_confirmation, 
                                  :current_password)
  end

  
end