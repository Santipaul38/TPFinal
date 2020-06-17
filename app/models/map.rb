class Map < ApplicationRecord
	has_many :ships	
	has_many :games

	validates :name, :columns, :rows, presence: true
	validates :name, uniqueness: true
	validates :columns, :rows, numericality: { only_integer: true }
	validates :columns, :rows, :inclusion => 8..20
	validates :name, length: { minimum: 4, maximum: 15 }

end
