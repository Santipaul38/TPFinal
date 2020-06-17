class AddTypeIdToShip < ActiveRecord::Migration[6.0]
  def change
    add_reference :ships, :type, null: true, foreign_key: true
  end
end
