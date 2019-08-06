class Target < ApplicationRecord
	belongs_to :certificate

	validates :target_passers, numericality: { only_integer: true }
end
