class UserCertificateRecordsController < ApplicationController

	def index
		
	end

  def create
    certificate_id = params[:format].to_i
    
    @user = User.find(current_user.id)
    @record = @user.user_certificate_records.build(certificate_id: certificate_id)
    #@user.certificates << Certificate.find(certificate_id)
    #@user.user_certificate_records.create(certificate_id: certificate_id, status: 'Taken')

    if @record.save
      flash[:notice] = "Certification added to your wishlist."
      redirect_to certificate_path(certificate_id)
    else
      flash[:alert] = "Something went wrong.Please try again."
      redirect_to certificate_path(certificate_id)
    end
  end

  def update
    @record = UserCertificateRecord.find(params[:id])
    current_page = Rails.application.routes.recognize_path(request.referrer)

    if @record.update(status: params[:status])
      flash[:notice] = "Certification status updated."
      
      if current_page[:controller] == "users"
        redirect_to user_path(@record.user_id)
      elsif current_page[:controller] == "certificates"
        redirect_to certificate_path(@record.certificate_id)
      end
    else
      flash[:alert] = "Something went wrong.Please try again."
      if current_page[:controller] == "users"
        redirect_to user_path(@record.user_id)
      elsif current_page[:controller] == "certificates"
        redirect_to certificate_path(@record.certificate_id)
      end
    end
  end

  def destroy
  	@record = UserCertificateRecord.find(params[:id])
    
    if @record.destroy
      flash[:success] = "Certification removed from your wishlist."
      redirect_to certificate_path(@record.certificate_id)
    else
      flash[:alert] = "Something went wrong.Please try again."
      redirect_to certificate_path(@record.certificate_id)
    end
  end

end
