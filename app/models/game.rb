class Game < ApplicationRecord
	belongs_to :user

	validates :name, :map_id, presence: true
	validates :name, uniqueness: true
	validates :name, length: { minimum: 4, maximum: 15 }

end
