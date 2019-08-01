class Category < ApplicationRecord
    has_many :certificates

    validates :name, presence: true
end
