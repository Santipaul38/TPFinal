class AddMapIdToShip < ActiveRecord::Migration[6.0]
  def change
    add_reference :ships, :map, null: true, foreign_key: true
  end
end
