class User < ApplicationRecord
    # associations
    has_one :profile, dependent: :destroy
    has_many :attendances, dependent: :destroy;

    # email validations
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

    # password validations
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }

    # mobile_number validations
    validates :mobile_number, presence: true, uniqueness: true, format: { with: /\A[+]?\d+\z/, message: "must be a valid phone number" }
end
