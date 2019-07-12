class SessionsController < Devise::SessionsController

  # POST /resource/sign_in
  def create
    super
    flash.delete(:notice)
  end

end