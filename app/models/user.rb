class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :registerable, 
  			:rememberable, :validatable, :timeoutable

  validates :first_name, :middle_name, :last_name, presence: true

  has_many :user_training_records
  has_many :user_certificate_records
  has_many :certificates, through: :user_certificate_records
  belongs_to :business_unit, counter_cache: true

  filterrific(
   default_filter_params: {},
   available_filters: [
     #:sorted_by,
     :search_query,
     :with_business_unit_id,
   ]
 )

  scope :search_query, -> (query) {
    where("first_name LIKE ? OR last_name LIKE ?", "%#{query}%", "%#{query}%")
  }

  scope :with_business_unit_id, -> (bu_id) {
  	where(business_unit_id: bu_id)   
  }

  # scope :sorted_by, -> (sort_key) {
  #   # Sorts students by sort_key
  # }

end
