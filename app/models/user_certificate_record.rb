class UserCertificateRecord < ApplicationRecord
  belongs_to :user
  belongs_to :certificate
  has_many :exam_histories
end
