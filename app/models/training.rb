class Training < ApplicationRecord
  belongs_to :certificate
  has_many :user_training_records
  validates :name, presence: true
end
