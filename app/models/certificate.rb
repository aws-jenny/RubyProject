class Certificate < ApplicationRecord
    validates :name, presence: true
end
