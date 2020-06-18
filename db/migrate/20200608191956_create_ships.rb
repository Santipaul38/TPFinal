class CreateShips < ActiveRecord::Migration[6.0]
  def change
    create_table :ships do |t|
      t.string :type
      t.integer :long
      t.integer :posX
      t.integer :posY
      t.string :orientation

      t.timestamps
    end
  end
end
