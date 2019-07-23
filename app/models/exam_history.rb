class ExamHistory < ApplicationRecord
  belongs_to :user_certificate_record
  validates :examinee_code, presence: true
  validates :exam_date, presence: true
end
