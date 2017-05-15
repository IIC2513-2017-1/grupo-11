class User < ApplicationRecord
	has_secure_password
	has_many :likes
	has_many :proyects, :dependent => :destroy
	has_many :proyects, as: :liked_proyects, :through => :likes
	has_many :comments, :dependent => :destroy

	validates :password, presence: true, length: {minimum: 6},
						confirmation: true, allow_blank: false
	validates :mail, presence: true, uniqueness: true, allow_blank: false,
						format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates :username, uniqueness: true

end
