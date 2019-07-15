class Certificate < ApplicationRecord
    has_many :trainings
    has_many :associations
    has_many :associates, :through => :associations
    validates :name, presence: true
end
