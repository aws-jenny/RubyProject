class Certificate < ApplicationRecord
    has_many :trainings
    has_many :associations
    has_many :associates, :through => :associations
    has_many :user_certificate_records
    has_many :users, through: :user_certificate_records
    has_many :recommendations
    
    validates :name, presence: true
end
