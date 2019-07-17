class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :registerable, 
  			:rememberable, :validatable, :timeoutable

  validates :first_name, :middle_name, :last_name, presence: true

  has_many :user_training_records
end
