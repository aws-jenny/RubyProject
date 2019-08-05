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

		@top_certs = UserCertificateRecord.joins(:certificate).where(status: 'Passed').group(:name).order('count_id desc').
					limit(5).count('id')

		#query for getting all recommendations and # of passers who have been recommended for the certification
		# @recommendations = Recommendation.all
		# @user_ids = @recommendations.map{ |x| x.user_id}
		# @cert_ids = @recommendations.map{ |x| x.certificate_id}
		# @recommended_and_passed = UserCertificateRecord.joins(:certificate).where(status: 'Passed', user_id: @user_ids,
		# 	certificate_id: @cert_ids).group(:name).count('id')\\

		
		@selected_fy = CURRENT_FISCAL_YEAR
		if params.has_key?(:selected_fy)
			@selected_fy = params[:selected_fy]
		end

		@targets = Target.joins(:certificate).where(fiscal_year: @selected_fy)
		@target_certification_ids = @targets.map{ |x| x.certificate_id}
	
		@fy_passers = UserCertificateRecord.joins(:exam_histories)
											.where(status: 'Passed', 
													certificate_id: @target_certification_ids,
													exam_histories: {exam_date: Date.new(@selected_fy.to_i, 4, 1)..Date.new(@selected_fy.to_i + 1, 3, 31)})
		#@fy_passers = UserCertificateRecord.joins(:exam_histories).where("status = 'Passed' AND user_certificate_records.certificate_id in (?) AND exam_date between ? AND ?", @target_certification_ids, Date.new(@selected_fy.to_i, 4, 1), Date.new(@selected_fy.to_i + 1, 3, 31))
				
	end
end
