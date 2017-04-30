class Proyect < ApplicationRecord
	has_and_belongs_to_many :users
	has_many :comments
	belongs_to :category

	validates :name, :due_date, :goal_money, presence: true
	validates :score, numericality: true
	validates :goal_money, :actual_money, numericality: {greater_than_or_equal_to: 0}

	validate :due_date_cannot_be_in_the_past

	def due_date_cannot_be_in_the_past
		errors.add(:due_date, "Fecha de expiración debe ser superior a la actual") if due_date < Date.today
	end
end
