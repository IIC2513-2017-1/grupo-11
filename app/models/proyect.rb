class Proyect < ApplicationRecord

	belongs_to :category	
	belongs_to :user

	has_many :likes
	has_many :donations
	has_many :comments, :dependent => :destroy
	alias_attribute :founder, :user

	validates :name, :due_date, :goal_money, presence: true
	validates :score, numericality: {greater_than_or_equal_to: 0}
	validates :goal_money, :actual_money, numericality: {greater_than_or_equal_to: 0}

	validate :due_date_cannot_be_in_the_past

	def due_date_cannot_be_in_the_past
		errors.add(:due_date, "Fecha de expiración debe ser superior a la actual") if due_date < Date.today
	end

	scope :restricted_for, (lambda { |user|
		where(founder: user.username) if user
  })

	def is_liker(user)
		likes.where(user: user).count > 0
	end

	def total_amount
		donations.pluck(:amount).sum
	end
end
