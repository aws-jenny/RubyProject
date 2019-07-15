class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def after_sign_out_path_for(resource)
  	new_user_session_path
	end

	def redirect_unless_admin
    unless current_user.try(:isAdmin?)
      flash[:alert] = "Only admins can do that."
      redirect_back fallback_location: authenticated_root_path
    end
  end
  
end
