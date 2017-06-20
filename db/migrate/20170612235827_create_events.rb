class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :creator_id
      t.integer :attendee_id
      t.string :title
      t.string :subject
      t.text :description
      t.date :date
      t.time :time
      t.string :location

      t.timestamps null: false
    end
  end
end
