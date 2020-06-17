class Type < ApplicationRecord
	has_and_belongs_to_many :ships

	validates :name, uniqueness: true
	validates :name, :large, presence: true
	validates :large, numericality: {only_integer: true}
	validates :large, :inclusion => 1..6

end
