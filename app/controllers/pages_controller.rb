class PagesController < ApplicationController
	def index
		# @user_certificates = current_user.user_certificate_records

		# if params.has_key?(:status) && params[:status] != 'All'
		# 	@user_certificates = current_user.user_certificate_records.where("status = ?", params[:status])
		# end

		@ongoing = current_user.user_certificate_records.where(status: 'Ongoing')
		@taken = current_user.user_certificate_records.where(status: 'Taken')
		@passed = current_user.user_certificate_records.where(status: 'Passed')

		@passed_certs = UserCertificateRecord.where(status: 'Passed')

		 # select certificate_id, count(certificate_id) as "certified users" from user_certificate_records where status = 'Ongoing' 
 # 	group by certificate_id order by count(certificate_id) desc;
	end
end
