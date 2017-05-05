class User < ApplicationRecord
	has_secure_password

	has_and_belongs_to_many :proyects
	has_many :comments, :dependent => :destroy

	validates :password, presence: true, length: {minimum: 6},
						confirmation: true, allow_blank: false
	validates :mail, presence: true, uniqueness: true, allow_blank: false,
						format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates :username, uniqueness: true

end
