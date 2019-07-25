class UserCertificateRecord < ApplicationRecord
  belongs_to :user
  belongs_to :certificate
  has_many :exam_histories
  

 #  def self.most_number_of_passers
 #  	group("certificate_id")
 #  	order("total_passers desc").limit(5)
 #  	pluck("certificate_id, count(certificate_id) as total_passers")
 #	end

end



 # select certificate_id, count(certificate_id) from user_certificate_records where status = 'Ongoing' group by certificate_id;
 # select certificate_id, count(certificate_id) as "certified users" from user_certificate_records where status = 'Ongoing' 
 # 	group by certificate_id order by count(certificate_id) desc;