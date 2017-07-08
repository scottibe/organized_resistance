class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :creator_id
      t.string :title
      t.text :description
      t.date :date
      t.time :time
      t.string :location_name
      t.string :street_address
      t.string :city 
      t.string :state 
      t.integer :zip

      t.timestamps null: false
    end
  end
end
