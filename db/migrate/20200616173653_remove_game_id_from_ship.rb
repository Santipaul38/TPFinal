class RemoveGameIdFromShip < ActiveRecord::Migration[6.0]
  def change
    remove_reference :ships, :game, null: false, foreign_key: true
  end
end
