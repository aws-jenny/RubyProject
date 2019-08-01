class PagesController < ApplicationController
	def index
		# @user_certificates = current_user.user_certificate_records

		# if params.has_key?(:status) && params[:status] != 'All'
		# 	@user_certificates = current_user.user_certificate_records.where("status = ?", params[:status])
		# end
		@onWish = current_user.user_certificate_records.where(status: 'Wished')
		@ongoing = current_user.user_certificate_records.where(status: 'Ongoing')
		@taken = current_user.user_certificate_records.where(status: 'Taken')
		@passed = current_user.user_certificate_records.where(status: 'Passed')

		#@passed_certs = UserCertificateRecord.joins(:certificate).where(status: 'Passed')
		@top_certs = UserCertificateRecord.joins(:certificate).where(status: 'Passed').group(:name).order('count_id desc').
					limit(5).count('id')
		@recommendations = Recommendation.all

		@user_ids = @recommendations.map{ |x| x.user_id}
		@cert_ids = @recommendations.map{ |x| x.certificate_id}

		@recommended_and_passed = UserCertificateRecord.joins(:certificate).where(status: 'Passed', user_id: @user_ids,
			certificate_id: @cert_ids).group(:name).count('id')
		
		#@recommended_and_passed = []

		#@recommendations.each do |recommended|

			#@record = (UserCertificateRecord.where(user_id: recommended.user_id, certificate_id: recommended.certificate_id, status: 'Passed'))
				
				# @passed_certs.each do |record|
				# 	if(record.user_id == recommended.user_id && record.certificate_id == recommended.certificate_id)
				# 		@recommended_and_passed.push(record)
				# 	end
				# end

			# unless @record.blank?
			# 	@recommended_and_passed.push(@record)
			# end
		# end

		# puts @recommended_and_passed.size
		 # select certificate_id, count(certificate_id) as "certified users" from user_certificate_records where status = 'Ongoing' 
 # 	group by certificate_id order by count(certificate_id) desc;
	end
end
