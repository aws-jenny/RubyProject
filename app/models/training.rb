class Training < ApplicationRecord
  belongs_to :certificate
  validates :name, presence: true
end
