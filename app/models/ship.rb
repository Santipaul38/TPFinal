class Ship < ApplicationRecord
	require 'matrix'

	belongs_to :map
	belongs_to :type

	validates :orientation, :map_id, :type_id, :posX, :posY, presence: true
	validates :posX, :posY, numericality: {only_integer: true}
	validates :posX, :posY, :inclusion => 1..20

	validate :position
	validate :orientationVH
	validate :quantity

	def position
		ships = Ship.all
		map = self.map
		matriz = Matrix.build(map.rows, map.columns){0}

		for s in ships
			if s.user_id == self.user_id
				if (s.posX == self.posX) and (s.posY == self.posY) 
					errors.add(:posX, "This position (X, Y) is not empty")
				end
			end	
		end

		for s in ships
			o = s.orientation.downcase
			if s.user_id == self.user_id
				case o
				when "vertical"
					if (map.rows - s.type.large) >= (s.posY-1)
						for i in 0..(s.type.large - 1)
							matriz[((s.posY-1) + i), (s.posX-1)] = true
						end
					else
						for i in 0..(s.type.large - 1)
							matriz[((s.posY-1) - i), (s.posX-1)] = true
						end
					end

				when "horizontal"
					if (map.columns - s.type.large) >= (s.posX-1)
						for i in 0..(s.type.large - 1)
							matriz[(s.posY-1), ((s.posX-1) + i)] = true
						end
					else
						for i in 0..(s.type.large - 1)
							matriz[(s.posY-1), ((s.posX-1) - i)] = true
						end
					end
				end
			end
		end

	end

	def quantity
		ships = Ship.all
		@count = 0

		for s in ships
			if s.user_id == self.user_id
				if @count < 4
					@count = @count +1
				elsif @count == 4
					errors.add(:map, "The 5 ships are already loaded")
				end
			end
		end
	end

	def orientationVH
		o = self.orientation.downcase
		case o
		when "vertical"

		when "horizontal"

		else
			errors.add(:orientation, "must be Horizontal or Vertical")
		end
	end


end
